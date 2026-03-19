defmodule BrilliantFantasticWeb.ContactLive do
  use BrilliantFantasticWeb, :live_view

  alias BrilliantFantastic.ContactForm

  require Logger

  def mount(_params, _session, socket) do
    changeset = ContactForm.changeset(%{})

    {:ok, assign(socket, form: to_form(changeset))}
  end

  def handle_event("validate", %{"contact_form" => params}, socket) do
    changeset =
      ContactForm.changeset(params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, form: to_form(changeset))}
  end

  def handle_event("submit", %{"contact_form" => params}, socket) do
    changeset = ContactForm.changeset(params)

    case Ecto.Changeset.apply_action(changeset, :submit) do
      {:ok, contact} ->
        Task.start(fn ->
          case BrilliantFantastic.ContactNotifier.deliver_contact_message(contact) do
            {:ok, _} -> :ok
            {:error, reason} -> Logger.error("Contact form email failed: #{inspect(reason)}")
          end
        end)

        socket =
          socket
          |> put_flash(:info, "Message sent! We'll get back to you soon.")
          |> assign(form: to_form(ContactForm.changeset(%{})))

        {:noreply, socket}

      {:error, changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end
end
