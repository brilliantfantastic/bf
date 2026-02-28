defmodule BrilliantFantasticWeb.BlogLive.Index do
  use BrilliantFantasticWeb, :live_view

  alias BrilliantFantastic.Blog

  @per_page 10

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(params, _uri, socket) do
    page = params |> Map.get("page", "1") |> String.to_integer() |> max(1)

    %{posts: posts, page: page, total_pages: total_pages} =
      Blog.published_posts(%{page: page, per_page: @per_page})

    {:noreply,
     socket
     |> assign(:posts, posts)
     |> assign(:page, page)
     |> assign(:total_pages, total_pages)
     |> assign(:page_title, "Blog")}
  end
end
