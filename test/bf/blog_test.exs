defmodule BrilliantFantastic.BlogTest do
  use ExUnit.Case, async: true

  alias BrilliantFantastic.Blog

  describe "all_posts/0" do
    test "returns posts sorted newest first" do
      posts = Blog.all_posts()
      assert [_ | _] = posts

      dates = Enum.map(posts, & &1.date)
      assert dates == Enum.sort(dates, {:desc, Date})
    end

    test "posts have required fields populated" do
      for post <- Blog.all_posts() do
        assert post.id
        assert post.title
        assert post.author
        assert post.summary
        assert post.date
        assert is_boolean(post.published)
        assert post.body
      end
    end
  end

  describe "published_posts/0" do
    test "returns only published posts" do
      posts = Blog.published_posts()

      for post <- posts do
        assert post.published == true
      end
    end

    test "returns posts sorted newest first" do
      posts = Blog.published_posts()
      dates = Enum.map(posts, & &1.date)
      assert dates == Enum.sort(dates, {:desc, Date})
    end
  end

  describe "published_posts/1" do
    test "paginates results" do
      result = Blog.published_posts(%{page: 1, per_page: 1})

      assert is_list(result.posts)
      assert length(result.posts) <= 1
      assert result.page == 1
      assert result.total_pages >= 1
    end

    test "clamps page to valid range" do
      result = Blog.published_posts(%{page: 999, per_page: 10})
      assert result.page <= result.total_pages

      result = Blog.published_posts(%{page: 0, per_page: 10})
      assert result.page >= 1
    end
  end

  describe "get_post_by_id/1" do
    test "returns a post when found" do
      [post | _] = Blog.published_posts()
      found = Blog.get_post_by_id(post.id)
      assert found.id == post.id
      assert found.title == post.title
    end

    test "returns nil when not found" do
      assert Blog.get_post_by_id("nonexistent-post-id") == nil
    end
  end

  describe "recent_posts/1" do
    test "returns at most N posts" do
      posts = Blog.recent_posts(1)
      assert length(posts) <= 1
    end

    test "returns published posts only" do
      for post <- Blog.recent_posts(100) do
        assert post.published == true
      end
    end
  end
end
