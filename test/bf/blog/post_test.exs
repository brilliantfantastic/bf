defmodule BrilliantFantastic.Blog.PostTest do
  use ExUnit.Case, async: true

  alias BrilliantFantastic.Blog.Post

  @attrs %{
    title: "A Post",
    author: "Jamie Wright",
    summary: "A summary",
    date: "2026-08-10",
    published: true
  }

  defp build(extra \\ %{}) do
    Post.build("priv/posts/a-post.md", Map.merge(@attrs, extra), "<p>body</p>")
  end

  describe "build/3 cover images" do
    test "reads url and alt from the grouped form" do
      post = build(%{cover_image: %{url: "/images/hero.png", alt: "A description"}})

      assert post.cover_image_url == "/images/hero.png"
      assert post.cover_image_alt == "A description"
    end

    test "allows the grouped form to omit alt" do
      post = build(%{cover_image: %{url: "/images/hero.png"}})

      assert post.cover_image_url == "/images/hero.png"
      assert post.cover_image_alt == nil
    end

    test "reads the flat form" do
      post = build(%{cover_image_url: "/images/hero.png", cover_image_alt: "A description"})

      assert post.cover_image_url == "/images/hero.png"
      assert post.cover_image_alt == "A description"
    end

    test "leaves both fields nil when no cover image is declared" do
      post = build()

      assert post.cover_image_url == nil
      assert post.cover_image_alt == nil
    end

    test "raises when cover_image is a bare string" do
      assert_raise ArgumentError, ~r/`cover_image` must be a map/, fn ->
        build(%{cover_image: "/images/hero.png"})
      end
    end

    test "raises when cover_image is nil" do
      assert_raise ArgumentError, ~r/`cover_image` must be a map/, fn ->
        build(%{cover_image: nil})
      end
    end

    test "raises when the grouped form has no url" do
      assert_raise ArgumentError, ~r/requires a `url`/, fn ->
        build(%{cover_image: %{alt: "A description"}})
      end
    end

    test "raises on unknown keys in the grouped form" do
      assert_raise ArgumentError, ~r/unknown cover_image keys: \[:caption\]/, fn ->
        build(%{cover_image: %{url: "/images/hero.png", caption: "A description"}})
      end
    end

    test "raises when the grouped and flat forms are mixed" do
      assert_raise ArgumentError, ~r/cannot set both/, fn ->
        build(%{cover_image: %{url: "/images/hero.png"}, cover_image_alt: "A description"})
      end
    end

    test "names the offending file in the error" do
      assert_raise ArgumentError, ~r/a-post\.md/, fn ->
        build(%{cover_image: "/images/hero.png"})
      end
    end
  end
end
