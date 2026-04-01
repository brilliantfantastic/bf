defmodule BrilliantFantasticWeb.HomeLive do
  use BrilliantFantasticWeb, :live_view

  alias BrilliantFantasticWeb.Components.Illustrations
  alias BrilliantFantastic.ContactForm

  require Logger

  @success_headlines [
    "Loud and clear, good buddy!",
    "Bold move, hitting send.",
    "Roger that, space cadet.",
    "Consider us bothered.",
    "Look at you, connecting.",
    "Officially in the void.",
    "Pigeon is en route.",
    "Read you loud and clear.",
    "Well, well, well.",
    "You had us at hello."
  ]

  @success_subtitles [
    "Our fastest carrier pigeon is already stretching its wings.",
    "Way faster than snail mail. Slightly slower than telepathy.",
    "A real human will read this. Wild, right?",
    "We've alerted the pigeons. They seem excited.",
    "No carrier pigeons were harmed in the sending of this message.",
    "Your words are traveling at the speed of internet. So, pretty fast.",
    "We could've used snail mail but we like you too much.",
    "Sit tight. We're composing a reply that's equally fantastic.",
    "The pigeons are arguing over who gets to deliver this one.",
    "Faster than a letter, slower than a hug. We'll be in touch."
  ]

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
      |> assign(:success_headline, Enum.random(@success_headlines))
      |> assign(:success_subtitle, Enum.random(@success_subtitles))

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
          |> assign(:success_headline, Enum.random(@success_headlines))
          |> assign(:success_subtitle, Enum.random(@success_subtitles))
          |> assign(form: to_form(ContactForm.changeset(%{})))

        {:noreply, socket}

      {:error, changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end
end
