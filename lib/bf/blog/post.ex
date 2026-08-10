defmodule BrilliantFantastic.Blog.Post do
  @moduledoc """
  Represents a single blog post parsed from a markdown file.
  """

  @defaults %{published: false}

  @cover_image_keys [:url, :alt]

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
    :cover_image_url,
    :cover_image_alt,
    :filename,
    :tags
  ]

  @doc """
  Builds a post from a front matter `attrs` map.

  A cover image is declared as a url on its own:

      cover_image: "/images/blog/post/hero.png"

  grouped with its alt text:

      cover_image: %{url: "/images/blog/post/hero.png", alt: "A description"}

  or flat:

      cover_image_url: "/images/blog/post/hero.png",
      cover_image_alt: "A description"

  All three normalize to `:cover_image_url` and `:cover_image_alt`. The alt is
  optional, the url is not.
  """
  def build(filepath, attrs, body) do
    filename = filepath |> Path.split() |> List.last()

    attributes =
      attrs
      |> merge_defaults()
      |> convert_date()
      |> normalize_cover_image(filename)
      |> add_id()

    struct!(__MODULE__, [filename: filename, body: body] ++ Map.to_list(attributes))
  end

  defp merge_defaults(attributes), do: Map.merge(@defaults, attributes)

  defp convert_date(%{date: date} = attributes) do
    Map.put(attributes, :date, Date.from_iso8601!(date))
  end

  # Raises rather than silently dropping the image, since a typo here would not
  # surface until someone noticed a post had published without its cover.
  defp normalize_cover_image(%{cover_image: cover} = attributes, filename) do
    for key <- [:cover_image_url, :cover_image_alt], Map.has_key?(attributes, key) do
      raise ArgumentError, "#{filename}: cannot set both `cover_image` and `#{key}`"
    end

    cover = wrap_cover_image(cover, filename)
    validate_cover_image!(cover, filename)

    attributes
    |> Map.delete(:cover_image)
    |> Map.put(:cover_image_url, Map.get(cover, :url))
    |> Map.put(:cover_image_alt, Map.get(cover, :alt))
  end

  defp normalize_cover_image(attributes, _filename), do: attributes

  defp wrap_cover_image(nil, _filename), do: %{}
  defp wrap_cover_image(url, _filename) when is_binary(url), do: %{url: url}
  defp wrap_cover_image(cover, _filename) when is_map(cover), do: cover

  defp wrap_cover_image(other, filename) do
    raise ArgumentError, """
    #{filename}: `cover_image` must be a url or a map, got: #{inspect(other)}

    Use any of:

        cover_image: "/images/..."

        cover_image: %{url: "/images/...", alt: "A description"}

        cover_image_url: "/images/...",
        cover_image_alt: "A description"
    """
  end

  defp validate_cover_image!(cover, _filename) when map_size(cover) == 0, do: :ok

  defp validate_cover_image!(cover, filename) do
    case Map.keys(cover) -- @cover_image_keys do
      [] -> :ok
      unknown -> raise ArgumentError, "#{filename}: unknown cover_image keys: #{inspect(unknown)}"
    end

    unless is_binary(Map.get(cover, :url)) do
      raise ArgumentError, "#{filename}: cover_image requires a `url`"
    end
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
