defmodule BrilliantFantastic.Projects.Project do
  @moduledoc """
  Represents a single project (software or otherwise) shown on /projects.
  """

  @enforce_keys [:id, :name, :status, :started_on, :ended_on, :description]
  defstruct [
    :id,
    :name,
    :status,
    :started_on,
    :ended_on,
    :description,
    links: [],
    images: []
  ]

  @type status :: :live | :retired

  @type link :: %{label: String.t(), url: String.t()}

  @type image :: %{
          required(:src) => String.t(),
          required(:alt) => String.t(),
          optional(:poster) => String.t(),
          optional(:padded) => boolean()
        }

  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t(),
          status: status,
          started_on: Date.t(),
          ended_on: Date.t() | :now,
          description: String.t(),
          links: [link],
          images: [image]
        }

  @doc """
  Build a project, deriving `id` from `name` if not provided.
  """
  def build(attrs) when is_map(attrs) do
    attrs = attrs |> add_id()
    struct!(__MODULE__, attrs)
  end

  defp add_id(%{id: _} = attrs), do: attrs
  defp add_id(%{name: name} = attrs), do: Map.put(attrs, :id, slugify(name))

  defp slugify(string) do
    string
    |> String.downcase()
    |> String.replace(~r/[^\w-]+/, "-")
    |> String.replace(~r/-{2,}/, "-")
    |> String.trim("-")
  end
end
