defmodule BrilliantFantasticWeb.BlogLive.Show do
  use BrilliantFantasticWeb, :live_view

  alias BrilliantFantastic.Blog

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(%{"id" => id}, _uri, socket) do
    case Blog.get_post_by_id(id) do
      nil ->
        {:noreply,
         socket
         |> put_flash(:error, "Post not found")
         |> push_navigate(to: ~p"/blog")}

      post ->
        {:noreply,
         socket
         |> assign(:post, post)
         |> assign(:page_title, post.title)}
    end
  end
end
