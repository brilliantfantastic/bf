defmodule BrilliantFantasticWeb.HomeLive do
  use BrilliantFantasticWeb, :live_view

  alias BrilliantFantasticWeb.Components.Illustrations
  alias BrilliantFantastic.ContactForm

  require Logger

  @directions ~w(
    transformation typography_art generative_canvas world_building
    anti_hero marquee typewriter chromatic tilt fragments
    neon_noir liquid terminal brutalist botanical holographic
    cosmic kaleidoscope
  )

  embed_templates "home_live/**/*"

  def mount(_params, _session, socket) do
    direction = if connected?(socket), do: Enum.random(@directions)

    socket =
      socket
      |> assign(:direction, direction)
      |> assign(:form, to_form(ContactForm.changeset(%{})))
      |> assign(:contact_submitted, false)

    {:ok, socket}
  end

  def handle_event("randomize-direction", _params, socket) do
    {:noreply, assign(socket, :direction, Enum.random(@directions))}
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
          |> assign(:contact_submitted, true)
          |> assign(form: to_form(ContactForm.changeset(%{})))

        {:noreply, socket}

      {:error, changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end
end
