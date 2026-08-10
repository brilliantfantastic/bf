defmodule BrilliantFantasticWeb.BlogLive.ShowCoverImageTest do
  @moduledoc """
  Covers the cover image branches of `show.html.heex` that no request can reach.

  `Blog.get_post_by_id/1` only returns published posts, and every published post
  with a cover image has alt text, so the alt fallback and the hidden caption are
  unreachable through the router. These render the template directly instead.
  """
  use ExUnit.Case, async: true

  import Phoenix.LiveViewTest

  alias BrilliantFantastic.Blog.Post
  alias BrilliantFantasticWeb.BlogLive.Show

  @attrs %{
    title: "A Post",
    author: "Jamie Wright",
    summary: "A summary",
    date: "2026-08-10",
    published: true
  }

  defp render_post(cover) do
    post = Post.build("priv/posts/a-post.md", Map.merge(@attrs, cover), "<p>body</p>")

    %{post: post, __changed__: nil}
    |> Show.render()
    |> rendered_to_string()
    |> LazyHTML.from_fragment()
  end

  defp attribute(doc, selector, name) do
    doc |> LazyHTML.query(selector) |> LazyHTML.attribute(name)
  end

  defp count(doc, selector) do
    doc |> LazyHTML.query(selector) |> Enum.count()
  end

  describe "cover image without alt text" do
    setup do
      %{doc: render_post(%{cover_image: %{url: "/images/hero.png"}})}
    end

    test "falls back to the post title for alt", %{doc: doc} do
      assert attribute(doc, "figure.brutal-cover img", "alt") == ["A Post"]
    end

    test "renders no caption", %{doc: doc} do
      assert count(doc, "figure.brutal-cover figcaption") == 0
    end

    test "still renders the image", %{doc: doc} do
      assert attribute(doc, "figure.brutal-cover img", "src") == ["/images/hero.png"]
    end
  end

  describe "cover image with alt text" do
    setup do
      cover = %{cover_image: %{url: "/images/hero.png", alt: "A description"}}
      %{doc: render_post(cover)}
    end

    test "uses the alt text rather than the title", %{doc: doc} do
      assert attribute(doc, "figure.brutal-cover img", "alt") == ["A description"]
    end

    test "renders the alt text as a caption", %{doc: doc} do
      assert count(doc, "figure.brutal-cover figcaption") == 1

      assert doc
             |> LazyHTML.query("figure.brutal-cover figcaption")
             |> LazyHTML.text()
             |> String.trim() == "A description"
    end
  end

  describe "no cover image" do
    test "renders no figure at all" do
      doc = render_post(%{})

      assert count(doc, "figure.brutal-cover") == 0
    end
  end
end
