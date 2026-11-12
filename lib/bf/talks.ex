defmodule BrilliantFantastic.Talks do
  @moduledoc """
  Compile-time talks engine powered by NimblePublisher.

  Parses markdown files from `priv/talks/` into `Talks.Talk` structs
  at compile time. All query functions operate on in-memory lists.
  """

  alias BrilliantFantastic.Talks.Talk

  use NimblePublisher,
    build: Talk,
    from: Application.app_dir(:bf, "priv/talks/*.md"),
    as: :talks,
    highlighters: [:makeup_elixir, :makeup_erlang]

  @talks Enum.sort_by(@talks, & &1.date, {:desc, Date})

  @doc "Returns all talks (published and unpublished), sorted newest first."
  def all_talks, do: @talks

  @doc "Returns all published talks, sorted newest first."
  def published_talks do
    all_talks() |> Enum.filter(& &1.published)
  end

  @doc "Finds a published talk by id, or returns nil."
  def get_talk_by_id(id) do
    published_talks() |> Enum.find(&(&1.id == id))
  end
end
