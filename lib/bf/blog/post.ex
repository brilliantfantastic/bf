defmodule BrilliantFantastic.Blog.Post do
  @moduledoc """
  Represents a single blog post parsed from a markdown file.
  """

  @defaults %{published: false}

  @enforce_keys [:id, :author, :title, :summary, :date, :published]
  defstruct [
    :id,
    :author,
    :title,
    :body,
    :slug,
    :summary,
    :date,
    :published,
    :cover_image,
    :filename,
    :tags
  ]

  def build(filepath, attrs, body) do
    filename = filepath |> Path.split() |> List.last()
    attributes = attrs |> merge_defaults() |> convert_date() |> add_id()

    struct!(__MODULE__, [filename: filename, body: body] ++ Map.to_list(attributes))
  end

  defp merge_defaults(attributes), do: Map.merge(@defaults, attributes)

  defp convert_date(%{date: date} = attributes) do
    Map.put(attributes, :date, Date.from_iso8601!(date))
  end

  defp add_id(%{id: _id} = attributes), do: attributes
  defp add_id(%{slug: slug} = attributes), do: Map.put(attributes, :id, slugify(slug))
  defp add_id(%{title: title} = attributes), do: Map.put(attributes, :id, slugify(title))

  defp slugify(string) do
    string
    |> String.downcase()
    |> String.replace(~r/[^\w-]+/, "-")
    |> String.replace(~r/-{2,}/, "-")
    |> String.trim("-")
  end
end
