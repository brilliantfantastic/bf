defmodule BrilliantFantastic.Talks.Talk do
  @moduledoc """
  Represents a single talk parsed from a markdown file.

  ## Example front matter

      %{
        title: "The Talk Title",
        event: "ExMex 2026",
        event_url: "https://...",            # optional
        location: "Mexico City",             # optional
        date: "2026-11-05",
        summary: "One line for the index + meta description.",
        speakerdeck_id: "a1b2c3d4e5f6...",   # optional; the id from Speaker Deck's embed code
        slides_url: "https://speakerdeck.com/jwright/the-talk-title",  # optional
        sections: [:hire, :projects, :recent_posts],                   # optional; has a default
        published: true
      }

  The file name without `.md` becomes the `:id` (e.g. `2026-exmex.md` → `"2026-exmex"`).
  """

  @sections ~w(hire projects recent_posts contact)a
  @defaults %{published: false, sections: [:hire, :projects, :recent_posts]}

  @enforce_keys [:id, :title, :event, :date, :summary, :published]
  defstruct [
    :id,
    :title,
    :event,
    :event_url,
    :location,
    :date,
    :summary,
    :speakerdeck_id,
    :slides_url,
    :sections,
    :published,
    :body,
    :filename
  ]

  @doc "Returns the list of allowed section atoms."
  def sections, do: @sections

  @doc """
  Builds a `Talk` struct from a NimblePublisher `filepath`, front matter `attrs`, and `body`.

  The id is always taken from the filename stem (no slug/title fallback).
  """
  def build(filepath, attrs, body) do
    filename = filepath |> Path.split() |> List.last()
    id = Path.rootname(filename)

    attributes =
      attrs
      |> merge_defaults()
      |> convert_date()
      |> validate_sections(filename)

    struct!(__MODULE__, [id: id, filename: filename, body: body] ++ Map.to_list(attributes))
  end

  defp merge_defaults(attributes), do: Map.merge(@defaults, attributes)

  defp convert_date(%{date: date} = attributes) do
    Map.put(attributes, :date, Date.from_iso8601!(date))
  end

  # Let struct! report the missing :date via @enforce_keys.
  defp convert_date(attributes), do: attributes

  defp validate_sections(%{sections: sections} = attributes, filename) when is_list(sections) do
    case sections -- @sections do
      [] ->
        attributes

      unknown ->
        raise ArgumentError, "#{filename}: unknown sections: #{inspect(unknown)}"
    end
  end

  defp validate_sections(%{sections: _}, filename) do
    raise ArgumentError, "#{filename}: `sections` must be a list of atoms"
  end
end
