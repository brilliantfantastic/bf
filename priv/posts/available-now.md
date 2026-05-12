%{
  title: "Available Now",
  author: "Jamie Wright",
  slug: "available-now",
  summary: "A nice website overhaul is available now. Turns out, I am too.",
  date: "2026-05-12",
  published: true,
  tags: ["bf", "consulting"],
  cover_image: nil
}
---

## Welcome

This is the first post on the **Brilliant Fantastic** blog. We'll be writing about
software, design, music, and whatever else catches our attention.

## A Little Elixir

Here's a taste of what powers this site:

```elixir
defmodule BrilliantFantastic.Blog do
  use NimblePublisher,
    build: Post,
    from: Application.app_dir(:bf, "priv/posts/*.md"),
    as: :posts,
    highlighters: [:makeup_elixir, :makeup_erlang]

  @posts Enum.sort_by(@posts, & &1.date, {:desc, Date})

  def all_posts, do: @posts
end
```

Every markdown file in `priv/posts/` gets compiled into an in-memory struct at build time.
No database, no runtime parsing. Just fast, simple content.

## What's Next

More posts. More code. More fun. Stay tuned.
