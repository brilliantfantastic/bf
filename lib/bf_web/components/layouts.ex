defmodule BrilliantFantasticWeb.Layouts do
  @moduledoc """
  This module holds layouts and related functionality
  used by your application.
  """
  use BrilliantFantasticWeb, :html

  alias BrilliantFantasticWeb.Components.Illustrations

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
  Renders a sticky responsive navigation menu.

  Desktop shows a horizontal link bar; mobile shows a hamburger button
  that opens a full-screen overlay. Uses daisyUI semantic color classes
  so it automatically adapts to the active theme.
  """
  def nav_menu(assigns) do
    ~H"""
    <nav id="section-nav" class="sticky top-0 z-20 bg-base-200/90 backdrop-blur border-b border-base-300">
      <%!-- Desktop: horizontal links spread across full width --%>
      <div class="hidden lg:flex items-center justify-between px-6 lg:px-16 py-3">
        <a href="/" class="nav-logo font-display text-xl">Brilliant Fantastic</a>
        <a
          href="/blog"
          class="font-display tracking-wide text-base-content/70 hover:text-primary transition-colors"
        >
          Blog
        </a>
        <a
          href="/projects"
          class="font-display tracking-wide text-base-content/70 hover:text-primary transition-colors"
        >
          Projects
        </a>
        <a
          href="/for_hire"
          class="font-display tracking-wide text-base-content/70 hover:text-primary transition-colors"
        >
          For Hire
        </a>
        <a
          href="/contact"
          class="font-display tracking-wide text-base-content/70 hover:text-primary transition-colors"
        >
          Contact
        </a>
        <div id="theme-toggle-nav"><.theme_toggle /></div>
      </div>

      <%!-- Mobile: hamburger + vertical menu --%>
      <div class="lg:hidden">
        <div class="flex items-center justify-between px-6 py-3">
          <a href="/" class="nav-logo font-display text-xl">Brilliant Fantastic</a>
          <div class="flex items-center gap-3">
            <div id="theme-toggle-nav-mobile"><.theme_toggle /></div>
            <button phx-click={JS.toggle(to: "#mobile-menu")} aria-label="Toggle menu">
              <.icon name="hero-bars-3" class="size-6" />
            </button>
          </div>
        </div>

        <ul
          id="mobile-menu"
          class="hidden menu menu-vertical bg-base-200/90 border-t border-base-300 px-6 pb-4"
        >
          <li><a href="/blog" class="font-display text-lg">Blog</a></li>
          <li><a href="/projects" class="font-display text-lg">Projects</a></li>
          <li><a href="/for_hire" class="font-display text-lg">For Hire</a></li>
          <li><a href="/contact" class="font-display text-lg">Contact</a></li>
        </ul>
      </div>
    </nav>
    """
  end

  @doc """
  Renders a decorative background of scattered sparkle shapes.

  Only visible when the fantastic theme is active, using the
  `hidden fantastic:block` CSS variant mechanism.
  """
  def sparkle_background(assigns) do
    ~H"""
    <div
      class="hidden fantastic:block fixed inset-0 z-0 overflow-hidden pointer-events-none"
      style="color: var(--color-sparkle)"
      aria-hidden="true"
    >
      <.sparkle class="absolute w-2 opacity-40" style="top: 3%; left: 12%;" />
      <.sparkle class="absolute w-4 opacity-40" style="top: 7%; left: 55%;" />
      <.sparkle class="absolute w-2 opacity-40" style="top: 11%; left: 82%;" />
      <.sparkle class="absolute w-3 opacity-40" style="top: 15%; left: 30%;" />
      <.sparkle class="absolute w-2 opacity-40" style="top: 18%; left: 68%;" />
      <.sparkle class="absolute w-4 opacity-40" style="top: 22%; left: 5%;" />
      <.sparkle class="absolute w-2 opacity-40" style="top: 26%; left: 44%;" />
      <.sparkle class="absolute w-3 opacity-40" style="top: 30%; left: 91%;" />
      <.sparkle class="absolute w-2 opacity-40" style="top: 34%; left: 18%;" />
      <.sparkle class="absolute w-4 opacity-40" style="top: 38%; left: 76%;" />
      <.sparkle class="absolute w-2 opacity-40" style="top: 42%; left: 38%;" />
      <.sparkle class="absolute w-3 opacity-40" style="top: 46%; left: 62%;" />
      <.sparkle class="absolute w-2 opacity-40" style="top: 50%; left: 8%;" />
      <.sparkle class="absolute w-4 opacity-40" style="top: 53%; left: 50%;" />
      <.sparkle class="absolute w-2 opacity-40" style="top: 57%; left: 25%;" />
      <.sparkle class="absolute w-3 opacity-40" style="top: 61%; left: 85%;" />
      <.sparkle class="absolute w-2 opacity-40" style="top: 65%; left: 42%;" />
      <.sparkle class="absolute w-4 opacity-40" style="top: 69%; left: 15%;" />
      <.sparkle class="absolute w-2 opacity-40" style="top: 73%; left: 70%;" />
      <.sparkle class="absolute w-3 opacity-40" style="top: 77%; left: 33%;" />
      <.sparkle class="absolute w-2 opacity-40" style="top: 80%; left: 58%;" />
      <.sparkle class="absolute w-4 opacity-40" style="top: 84%; left: 88%;" />
      <.sparkle class="absolute w-2 opacity-40" style="top: 88%; left: 20%;" />
      <.sparkle class="absolute w-3 opacity-40" style="top: 92%; left: 48%;" />
      <.sparkle class="absolute w-2 opacity-40" style="top: 96%; left: 75%;" />
    </div>
    """
  end

  attr :class, :string, default: nil
  attr :style, :string, default: nil

  defp sparkle(assigns) do
    ~H"""
    <svg
      class={@class}
      style={@style}
      viewBox="0 0 20 20"
      fill="currentColor"
      xmlns="http://www.w3.org/2000/svg"
    >
      <path d="M10 0 L12 8 L20 10 L12 12 L10 20 L8 12 L0 10 L8 8 Z" />
    </svg>
    """
  end

  @doc """
  Renders a decorative background of animated SVG illustrations.

  Only visible when the fantastic theme is active, using the
  `hidden fantastic:block` CSS variant mechanism.
  """
  def robot_background(assigns) do
    ~H"""
    <div
      class="hidden fantastic:block fixed inset-0 z-0 overflow-hidden pointer-events-none"
      aria-hidden="true"
    >
      <Illustrations.sad_cactus
        class="absolute w-10 opacity-30 robot-animate-wobble"
        style="top: 5%; left: 8%;"
      />
      <Illustrations.ufo_beaming_cat
        class="absolute w-12 opacity-30 robot-animate-zigzag"
        style="top: 20%; left: 72%;"
      />
      <Illustrations.skull_flower
        class="absolute w-8 opacity-30 robot-animate-swoop"
        style="top: 55%; left: 4%;"
      />
      <Illustrations.cool_ghost
        class="absolute w-10 opacity-30 robot-animate-wander"
        style="top: 68%; left: 58%;"
      />
      <Illustrations.palm_and_moon
        class="absolute w-10 opacity-30 robot-animate-drift"
        style="top: 12%; left: 38%;"
      />
      <Illustrations.alien_head
        class="absolute w-8 opacity-30 robot-animate-wobble"
        style="top: 30%; left: 15%;"
      />
      <Illustrations.snake_and_dagger
        class="absolute w-8 opacity-30 robot-animate-zigzag"
        style="top: 45%; left: 85%;"
      />
      <Illustrations.cute_reaper
        class="absolute w-10 opacity-30 robot-animate-swoop"
        style="top: 78%; left: 22%;"
      />
      <Illustrations.cosmic_eye
        class="absolute w-12 opacity-30 robot-animate-wander"
        style="top: 38%; left: 48%;"
      />
      <Illustrations.melting_face
        class="absolute w-8 opacity-30 robot-animate-drift"
        style="top: 62%; left: 35%;"
      />
      <Illustrations.floating_helmet
        class="absolute w-10 opacity-30 robot-animate-wobble"
        style="top: 85%; left: 70%;"
      />
      <Illustrations.all_seeing_hand
        class="absolute w-8 opacity-30 robot-animate-swoop"
        style="top: 8%; left: 55%;"
      />
      <Illustrations.broken_heart
        class="absolute w-8 opacity-30 robot-animate-wander"
        style="top: 48%; left: 18%;"
      />
      <Illustrations.mushroom
        class="absolute w-10 opacity-30 robot-animate-drift"
        style="top: 88%; left: 45%;"
      />
      <Illustrations.coffin_flower
        class="absolute w-6 opacity-30 robot-animate-zigzag"
        style="top: 25%; left: 50%;"
      />
    </div>
    """
  end
end
