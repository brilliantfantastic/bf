defmodule BrilliantFantasticWeb.Layouts do
  @moduledoc """
  This module holds layouts and related functionality
  used by your application.
  """
  use BrilliantFantasticWeb, :html

  # Embed all files in layouts/* within this module.
  # The default root.html.heex file contains the HTML
  # skeleton of your application, namely HTML headers
  # and other static content.
  embed_templates "layouts/*"

  @doc """
  Renders your app layout.

  This function is typically invoked from every template,
  and it often contains your application menu, sidebar,
  or similar.

  ## Examples

      <Layouts.app flash={@flash}>
        <h1>Content</h1>
      </Layouts.app>

  """
  attr :flash, :map, required: true, doc: "the map of flash messages"

  attr :current_scope, :map,
    default: nil,
    doc: "the current [scope](https://hexdocs.pm/phoenix/scopes.html)"

  slot :inner_block, required: true

  def app(assigns) do
    ~H"""
    <header class="navbar px-4 sm:px-6 lg:px-8">
      <div class="flex-1">
        <a href="/" class="flex-1 flex w-fit items-center gap-2">
          <img src={~p"/images/logo.svg"} width="36" />
          <span class="text-sm font-semibold">v{Application.spec(:phoenix, :vsn)}</span>
        </a>
      </div>
      <div class="flex-none">
        <ul class="flex flex-column px-1 space-x-4 items-center">
          <li>
            <a href="https://phoenixframework.org/" class="btn btn-ghost">Website</a>
          </li>
          <li>
            <a href="https://github.com/phoenixframework/phoenix" class="btn btn-ghost">GitHub</a>
          </li>
          <li>
            <.theme_toggle />
          </li>
          <li>
            <a href="https://hexdocs.pm/phoenix/overview.html" class="btn btn-primary">
              Get Started <span aria-hidden="true">&rarr;</span>
            </a>
          </li>
        </ul>
      </div>
    </header>

    <main class="px-4 py-20 sm:px-6 lg:px-8">
      <div class="mx-auto max-w-2xl space-y-4">
        {render_slot(@inner_block)}
      </div>
    </main>

    <.flash_group flash={@flash} />
    """
  end

  @doc """
  Shows the flash group with standard titles and content.

  ## Examples

      <.flash_group flash={@flash} />
  """
  attr :flash, :map, required: true, doc: "the map of flash messages"
  attr :id, :string, default: "flash-group", doc: "the optional id of flash container"

  def flash_group(assigns) do
    ~H"""
    <div id={@id} aria-live="polite">
      <.flash kind={:info} flash={@flash} />
      <.flash kind={:error} flash={@flash} />

      <.flash
        id="client-error"
        kind={:error}
        title={gettext("We can't find the internet")}
        phx-disconnected={show(".phx-client-error #client-error") |> JS.remove_attribute("hidden")}
        phx-connected={hide("#client-error") |> JS.set_attribute({"hidden", ""})}
        hidden
      >
        {gettext("Attempting to reconnect")}
        <.icon name="hero-arrow-path" class="ml-1 size-3 motion-safe:animate-spin" />
      </.flash>

      <.flash
        id="server-error"
        kind={:error}
        title={gettext("Something went wrong!")}
        phx-disconnected={show(".phx-server-error #server-error") |> JS.remove_attribute("hidden")}
        phx-connected={hide("#server-error") |> JS.set_attribute({"hidden", ""})}
        hidden
      >
        {gettext("Attempting to reconnect")}
        <.icon name="hero-arrow-path" class="ml-1 size-3 motion-safe:animate-spin" />
      </.flash>
    </div>
    """
  end

  @doc """
  Provides brilliant vs fantastic theme toggle based on themes defined in app.css.

  See <head> in root.html.heex which applies the theme before page load.
  """
  def theme_toggle(assigns) do
    ~H"""
    <div class="card relative flex flex-row items-center border-2 border-base-300 bg-base-300 rounded-full">
      <div class="absolute w-1/3 h-full rounded-full border-1 border-base-200 bg-base-100 brightness-200 left-0 [[data-theme=brilliant]_&]:left-1/3 [[data-theme=fantastic]_&]:left-2/3 transition-[left]" />

      <button
        class="flex p-2 cursor-pointer w-1/3"
        phx-click={JS.dispatch("phx:set-theme")}
        data-phx-theme="system"
      >
        <.icon name="hero-swatch-solid" class="size-4 opacity-75 hover:opacity-100" />
      </button>

      <button
        class="flex p-2 cursor-pointer w-1/3"
        phx-click={JS.dispatch("phx:set-theme")}
        data-phx-theme="brilliant"
      >
        <.icon name="hero-scale-solid" class="size-4 opacity-75 hover:opacity-100" />
      </button>

      <button
        class="flex p-2 cursor-pointer w-1/3"
        phx-click={JS.dispatch("phx:set-theme")}
        data-phx-theme="fantastic"
      >
        <.icon name="hero-face-smile-solid" class="size-4 opacity-75 hover:opacity-100" />
      </button>
    </div>
    """
  end

  @doc """
  Renders a decorative background of animated SVG robots.

  Only visible when the fantastic theme is active, using the
  `hidden fantastic:block` CSS variant mechanism.
  """
  def robot_background(assigns) do
    ~H"""
    <div
      class="hidden fantastic:block fixed inset-0 z-0 overflow-hidden pointer-events-none"
      aria-hidden="true"
    >
      <%!-- Robot 1: Boxy robot --%>
      <svg
        class="absolute w-10 opacity-15 robot-animate-1"
        style="top: 8%; left: 12%;"
        viewBox="0 0 64 80"
        fill="currentColor"
        xmlns="http://www.w3.org/2000/svg"
      >
        <rect x="24" y="0" width="16" height="8" rx="2" />
        <rect x="8" y="12" width="48" height="36" rx="4" />
        <rect x="16" y="22" width="10" height="8" rx="2" />
        <rect x="38" y="22" width="10" height="8" rx="2" />
        <rect x="24" y="34" width="16" height="4" rx="1" />
        <rect x="12" y="52" width="16" height="24" rx="3" />
        <rect x="36" y="52" width="16" height="24" rx="3" />
        <rect x="0" y="20" width="6" height="20" rx="3" />
        <rect x="58" y="20" width="6" height="20" rx="3" />
      </svg>

      <%!-- Robot 2: Round/dome robot --%>
      <svg
        class="absolute w-8 opacity-12 robot-animate-2"
        style="top: 25%; left: 75%;"
        viewBox="0 0 64 72"
        fill="currentColor"
        xmlns="http://www.w3.org/2000/svg"
      >
        <circle cx="32" cy="24" r="24" />
        <circle cx="22" cy="20" r="5" fill="currentColor" opacity="0.3" />
        <circle cx="42" cy="20" r="5" fill="currentColor" opacity="0.3" />
        <ellipse cx="32" cy="32" rx="8" ry="3" opacity="0.3" />
        <rect x="12" y="48" width="40" height="16" rx="4" />
        <circle cx="20" cy="68" r="4" />
        <circle cx="44" cy="68" r="4" />
      </svg>

      <%!-- Robot 3: Tall/thin robot --%>
      <svg
        class="absolute w-6 opacity-18 robot-animate-3"
        style="top: 55%; left: 5%;"
        viewBox="0 0 40 100"
        fill="currentColor"
        xmlns="http://www.w3.org/2000/svg"
      >
        <rect x="12" y="0" width="16" height="4" rx="2" />
        <rect x="8" y="6" width="24" height="20" rx="6" />
        <circle cx="16" cy="14" r="3" opacity="0.3" />
        <circle cx="24" cy="14" r="3" opacity="0.3" />
        <rect x="14" y="28" width="12" height="32" rx="3" />
        <rect x="0" y="30" width="12" height="6" rx="3" />
        <rect x="28" y="30" width="12" height="6" rx="3" />
        <rect x="10" y="62" width="8" height="20" rx="2" />
        <rect x="22" y="62" width="8" height="20" rx="2" />
        <rect x="8" y="80" width="12" height="6" rx="3" />
        <rect x="20" y="80" width="12" height="6" rx="3" />
      </svg>

      <%!-- Robot 4: Squat/wide robot --%>
      <svg
        class="absolute w-14 opacity-10 robot-animate-4"
        style="top: 70%; left: 60%;"
        viewBox="0 0 80 56"
        fill="currentColor"
        xmlns="http://www.w3.org/2000/svg"
      >
        <rect x="28" y="0" width="24" height="6" rx="3" />
        <rect x="4" y="8" width="72" height="28" rx="8" />
        <circle cx="24" cy="22" r="6" opacity="0.3" />
        <circle cx="56" cy="22" r="6" opacity="0.3" />
        <rect x="32" y="26" width="16" height="4" rx="2" opacity="0.3" />
        <rect x="8" y="40" width="20" height="12" rx="4" />
        <rect x="52" y="40" width="20" height="12" rx="4" />
      </svg>

      <%!-- Robot 5: Wheeled robot --%>
      <svg
        class="absolute w-10 opacity-15 robot-animate-5"
        style="top: 40%; left: 35%;"
        viewBox="0 0 64 72"
        fill="currentColor"
        xmlns="http://www.w3.org/2000/svg"
      >
        <rect x="24" y="0" width="16" height="10" rx="3" />
        <rect x="10" y="12" width="44" height="32" rx="6" />
        <rect x="18" y="20" width="10" height="8" rx="2" opacity="0.3" />
        <rect x="36" y="20" width="10" height="8" rx="2" opacity="0.3" />
        <rect x="22" y="34" width="20" height="4" rx="2" opacity="0.3" />
        <rect x="14" y="46" width="36" height="10" rx="4" />
        <circle cx="18" cy="64" r="8" />
        <circle cx="46" cy="64" r="8" />
        <circle cx="18" cy="64" r="4" opacity="0.3" />
        <circle cx="46" cy="64" r="4" opacity="0.3" />
      </svg>

      <%!-- Robot 6: Triangular/angular robot --%>
      <svg
        class="absolute w-8 opacity-12 robot-animate-1"
        style="top: 15%; left: 50%;"
        viewBox="0 0 60 80"
        fill="currentColor"
        xmlns="http://www.w3.org/2000/svg"
      >
        <polygon points="30,0 50,24 10,24" />
        <rect x="8" y="26" width="44" height="30" rx="4" />
        <polygon points="20,34 24,42 16,42" opacity="0.3" />
        <polygon points="40,34 44,42 36,42" opacity="0.3" />
        <rect x="20" y="48" width="20" height="3" rx="1" opacity="0.3" />
        <rect x="12" y="60" width="14" height="18" rx="3" />
        <rect x="34" y="60" width="14" height="18" rx="3" />
      </svg>

      <%!-- Robot 7: Orb/sphere robot --%>
      <svg
        class="absolute w-10 opacity-10 robot-animate-2"
        style="top: 80%; left: 25%;"
        viewBox="0 0 64 64"
        fill="currentColor"
        xmlns="http://www.w3.org/2000/svg"
      >
        <circle cx="32" cy="32" r="30" />
        <circle cx="22" cy="24" r="6" opacity="0.3" />
        <circle cx="42" cy="24" r="6" opacity="0.3" />
        <ellipse cx="32" cy="40" rx="10" ry="5" opacity="0.3" />
        <rect x="28" y="0" width="8" height="6" rx="2" />
        <circle cx="8" cy="44" r="4" />
        <circle cx="56" cy="44" r="4" />
      </svg>

      <%!-- Robot 8: Antenna robot --%>
      <svg
        class="absolute w-8 opacity-18 robot-animate-3"
        style="top: 50%; left: 88%;"
        viewBox="0 0 56 88"
        fill="currentColor"
        xmlns="http://www.w3.org/2000/svg"
      >
        <circle cx="18" cy="4" r="4" />
        <rect x="16" y="8" width="4" height="12" />
        <circle cx="38" cy="4" r="4" />
        <rect x="36" y="8" width="4" height="12" />
        <rect x="6" y="22" width="44" height="30" rx="6" />
        <circle cx="20" cy="34" r="5" opacity="0.3" />
        <circle cx="36" cy="34" r="5" opacity="0.3" />
        <rect x="18" y="44" width="20" height="3" rx="1" opacity="0.3" />
        <rect x="16" y="56" width="24" height="14" rx="4" />
        <rect x="10" y="72" width="12" height="14" rx="3" />
        <rect x="34" y="72" width="12" height="14" rx="3" />
      </svg>

      <%!-- Robot 9: Mini caterpillar/tank robot --%>
      <svg
        class="absolute w-12 opacity-12 robot-animate-4"
        style="top: 35%; left: 92%;"
        viewBox="0 0 72 48"
        fill="currentColor"
        xmlns="http://www.w3.org/2000/svg"
      >
        <rect x="20" y="0" width="32" height="6" rx="3" />
        <rect x="8" y="8" width="56" height="22" rx="6" />
        <circle cx="26" cy="18" r="4" opacity="0.3" />
        <circle cx="46" cy="18" r="4" opacity="0.3" />
        <rect x="4" y="32" width="64" height="14" rx="7" />
        <circle cx="14" cy="39" r="5" opacity="0.3" />
        <circle cx="32" cy="39" r="5" opacity="0.3" />
        <circle cx="50" cy="39" r="5" opacity="0.3" />
      </svg>

      <%!-- Robot 10: Floating eye robot --%>
      <svg
        class="absolute w-8 opacity-15 robot-animate-5"
        style="top: 65%; left: 45%;"
        viewBox="0 0 56 64"
        fill="currentColor"
        xmlns="http://www.w3.org/2000/svg"
      >
        <ellipse cx="28" cy="24" rx="26" ry="22" />
        <circle cx="28" cy="20" r="12" opacity="0.3" />
        <circle cx="28" cy="20" r="6" opacity="0.5" />
        <rect x="8" y="48" width="8" height="14" rx="3" />
        <rect x="24" y="46" width="8" height="16" rx="3" />
        <rect x="40" y="48" width="8" height="14" rx="3" />
      </svg>
    </div>
    """
  end
end
