defmodule BrilliantFantastic.Blog do
  @moduledoc """
  Compile-time blog engine powered by NimblePublisher.

  Parses markdown files from `priv/posts/` into `Blog.Post` structs
  at compile time. All query functions operate on in-memory lists.
  """

  alias BrilliantFantastic.Blog.Post

  use NimblePublisher,
    build: Post,
    from: Application.app_dir(:bf, "priv/posts/*.md"),
    as: :posts,
    highlighters: [:makeup_elixir, :makeup_erlang]

  @posts Enum.sort_by(@posts, & &1.date, {:desc, Date})

  @doc "Returns all posts (published and unpublished), sorted newest first."
  def all_posts, do: @posts

  @doc "Returns all published posts, sorted newest first."
  def published_posts do
    all_posts() |> Enum.filter(& &1.published)
  end

  @doc """
  Returns a paginated slice of published posts.

  Accepts `%{page: integer, per_page: integer}` and returns
  `%{posts: [...], page: integer, total_pages: integer}`.
  """
  def published_posts(%{page: page, per_page: per_page}) do
    posts = published_posts()
    total = length(posts)
    total_pages = max(ceil(total / per_page), 1)
    page = page |> max(1) |> min(total_pages)

    %{
      posts: posts |> Enum.drop((page - 1) * per_page) |> Enum.take(per_page),
      page: page,
      total_pages: total_pages
    }
  end

  @doc "Finds a published post by ID, or returns nil."
  def get_post_by_id(id) do
    published_posts() |> Enum.find(&(&1.id == id))
  end

  @doc "Returns the first `count` published posts."
  def recent_posts(count) do
    published_posts() |> Enum.take(count)
  end
end
