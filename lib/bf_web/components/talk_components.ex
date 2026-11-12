defmodule BrilliantFantasticWeb.TalkComponents do
  @moduledoc """
  Function components for talk thank-you pages.

  Provides `talk_slides/1` for embedding Speaker Deck slides and
  `talk_section/1` for per-talk advertising sections.
  """

  use BrilliantFantasticWeb, :html

  alias BrilliantFantastic.Blog
  alias BrilliantFantastic.Projects

  # ── Slides ──────────────────────────────────────────────────────────

  @doc """
  Renders the Speaker Deck slides embed for a talk.

  Shows a 16:9 iframe when `talk.speakerdeck_id` is set, with an optional
  "View on Speaker Deck" link when `talk.slides_url` is set. When there
  is no speakerdeck_id, shows a "Slides coming soon" placeholder.
  """
  attr :talk, :map, required: true

  def talk_slides(%{talk: %{speakerdeck_id: nil}} = assigns) do
    ~H"""
    <div id="talk-slides" class="mt-10">
      <div
        id="talk-slides-placeholder"
        class="aspect-video flex items-center justify-center rounded-lg border border-base-300 bg-base-200/60"
      >
        <div class="text-center">
          <span class="brutal-label block mb-2">Slides</span>
          <p class="font-display text-xl text-base-content/60">Slides coming soon</p>
        </div>
      </div>
    </div>
    """
  end

  def talk_slides(assigns) do
    ~H"""
    <div id="talk-slides" class="mt-10">
      <div class="aspect-video rounded-lg overflow-hidden border border-base-300 shadow-sm">
        <iframe
          src={"https://speakerdeck.com/player/#{@talk.speakerdeck_id}"}
          title={@talk.title}
          loading="lazy"
          allowfullscreen
          class="w-full h-full"
        >
        </iframe>
      </div>
      <div :if={@talk.slides_url} class="mt-3 text-right">
        <a
          href={@talk.slides_url}
          class="text-sm font-display text-primary hover:text-primary/80 transition-colors"
          target="_blank"
          rel="noopener noreferrer"
        >
          View on Speaker Deck &rarr;
        </a>
      </div>
    </div>
    """
  end

  # ── Sections ─────────────────────────────────────────────────────────

  @doc """
  Renders a named advertising section for a talk.

  Dispatches on the `name` atom. Each section has a stable root id
  `talk-section-{name}` for tests and anchoring.

  Allowed names: `:hire`, `:projects`, `:recent_posts`, `:contact`.
  """
  attr :name, :atom, required: true
  attr :talk, :map, default: nil, doc: "the talk being shown, used to tag contact emails"

  def talk_section(%{name: :hire} = assigns) do
    assigns = assign(assigns, :available, Layouts.available_for_hire?())

    ~H"""
    <section id="talk-section-hire" class="mt-16 pt-10 border-t border-base-300">
      <span class="brutal-label block mb-3">Opportunities</span>
      <h2 class="font-display text-3xl lg:text-4xl mb-4">
        {if @available, do: "Open to new opportunities", else: "Let's keep talking"}
      </h2>
      <p class="text-base-content/70 mb-8 max-w-prose">
        <%= if @available do %>
          I'm open to contract and full-time opportunities. Whether you have a question
          from the talk or an opportunity to share, it comes straight to me.
        <% else %>
          Whether you have a question or an opportunity, it all lands in the same inbox,
          and I read every one.
        <% end %>
      </p>
      <div class="grid sm:grid-cols-2 gap-6">
        <a
          id="talk-contact-question"
          href={contact_path(question_subject(@talk))}
          class="group block rounded-lg border border-base-300 bg-base-200/60 p-6 transition hover:-translate-y-0.5 hover:border-primary hover:shadow-md"
        >
          <span class="brutal-label block mb-2">For individuals</span>
          <h3 class="font-display text-2xl mb-2">Got a question?</h3>
          <p class="text-base-content/70 mb-4">
            Something from the talk you want to dig into, or just want to say hi.
          </p>
          <span class="font-display text-primary group-hover:text-primary/80 transition-colors">
            Ask me &rarr;
          </span>
        </a>
        <a
          id="talk-contact-opportunity"
          href={contact_path(opportunity_subject(@talk))}
          class="group block rounded-lg border border-base-300 bg-base-200/60 p-6 transition hover:-translate-y-0.5 hover:border-primary hover:shadow-md"
        >
          <span class="brutal-label block mb-2">For companies</span>
          <h3 class="font-display text-2xl mb-2">Have an opportunity?</h3>
          <p class="text-base-content/70 mb-4">
            Tell me what you're building and we'll see whether we're a good fit.
          </p>
          <span class="font-display text-primary group-hover:text-primary/80 transition-colors">
            Let's talk &rarr;
          </span>
        </a>
      </div>
      <.link
        :if={@available}
        navigate={~p"/for_hire"}
        class="inline-block mt-6 font-display text-primary hover:text-primary/80 transition-colors"
      >
        More about working with me &rarr;
      </.link>
    </section>
    """
  end

  def talk_section(%{name: :projects} = assigns) do
    current_projects =
      Projects.all_projects()
      |> Enum.filter(&(&1.status == :current))
      |> Enum.take(3)

    assigns = assign(assigns, :projects, current_projects)

    ~H"""
    <section id="talk-section-projects" class="mt-16 pt-10 border-t border-base-300">
      <span class="brutal-label block mb-3">What I'm building</span>
      <h2 class="font-display text-3xl lg:text-4xl mb-8">Current projects</h2>
      <ul class="space-y-6">
        <li :for={project <- @projects} class="group">
          <h3 class="font-display text-xl mb-1">{project.name}</h3>
          <p class="text-base-content/70 text-sm leading-relaxed mb-2 max-w-prose">
            {project.description |> String.trim() |> String.split("\n") |> List.first()}
          </p>
          <a
            :for={link <- Enum.take(project.links, 1)}
            href={link.url}
            class="text-sm font-display text-primary hover:text-primary/80 transition-colors"
            target="_blank"
            rel="noopener noreferrer"
          >
            {link.label} &rarr;
          </a>
        </li>
      </ul>
      <div class="mt-8">
        <.link
          navigate={~p"/projects"}
          class="font-display text-primary hover:text-primary/80 transition-colors"
        >
          See all projects &rarr;
        </.link>
      </div>
    </section>
    """
  end

  def talk_section(%{name: :recent_posts} = assigns) do
    posts = Blog.recent_posts(3)
    assigns = assign(assigns, :posts, posts)

    ~H"""
    <section id="talk-section-recent-posts" class="mt-16 pt-10 border-t border-base-300">
      <span class="brutal-label block mb-3">From the blog</span>
      <h2 class="font-display text-3xl lg:text-4xl mb-8">Recent writing</h2>
      <ul :if={@posts != []} class="space-y-4">
        <li :for={post <- @posts} class="group">
          <.link
            navigate={~p"/blog/#{post.id}"}
            class="font-display text-lg text-base-content hover:text-primary transition-colors"
          >
            {post.title}
          </.link>
          <p class="text-sm text-base-content/60 mt-0.5">
            {Calendar.strftime(post.date, "%B %-d, %Y")}
          </p>
        </li>
      </ul>
      <div class="mt-8">
        <.link
          navigate={~p"/blog"}
          class="font-display text-primary hover:text-primary/80 transition-colors"
        >
          Read the blog &rarr;
        </.link>
      </div>
    </section>
    """
  end

  def talk_section(%{name: :contact} = assigns) do
    ~H"""
    <section id="talk-section-contact" class="mt-16 pt-10 border-t border-base-300">
      <span class="brutal-label block mb-3">Say hello</span>
      <h2 class="font-display text-3xl lg:text-4xl mb-4">Let's connect</h2>
      <p class="text-base-content/70 mb-6 max-w-prose">
        Have a question from the talk, want to continue the conversation, or just want to say hi?
        Drop me a line.
      </p>
      <a
        href="/#contact"
        class="inline-block font-display text-primary hover:text-primary/80 transition-colors text-lg"
      >
        Get in touch &rarr;
      </a>
    </section>
    """
  end

  # ── Contact links ────────────────────────────────────────────────────

  # Both cards open the home page contact form with the subject filled in,
  # so every message lands in the same inbox labeled by kind and talk, and
  # no email address is exposed on the page.
  defp question_subject(talk), do: "Question from #{event_name(talk)}"
  defp opportunity_subject(talk), do: "Opportunity (via #{event_name(talk)})"

  defp event_name(%{event: event}) when is_binary(event), do: "your #{event} talk"
  defp event_name(_talk), do: "your talk"

  defp contact_path(subject), do: ~p"/?#{[subject: subject]}" <> "#contact"
end
