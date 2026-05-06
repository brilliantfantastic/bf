defmodule BrilliantFantastic.Projects do
  @moduledoc """
  Hardcoded list of projects shown on the /projects page.

  Placeholder content for now — real projects, copy, and images come later.
  """

  alias BrilliantFantastic.Projects.Project

  @projects [
    %{
      name: "Lorem Atlas",
      status: :live,
      started_on: ~D[2023-04-12],
      ended_on: :now,
      description:
        "A placeholder description that runs about two short sentences. " <>
          "Just enough copy to feel real while we get the layout right.",
      links: [
        %{label: "Site", url: "https://example.com"},
        %{label: "GitHub", url: "https://github.com/example/atlas"}
      ],
      images: [
        %{src: "/images/projects/placeholder-1.svg", alt: "Lorem Atlas screenshot 1"},
        %{src: "/images/projects/placeholder-2.svg", alt: "Lorem Atlas screenshot 2"},
        %{src: "/images/projects/placeholder-3.svg", alt: "Lorem Atlas screenshot 3"},
        %{src: "/images/projects/placeholder-4.svg", alt: "Lorem Atlas logo"}
      ]
    },
    %{
      name: "Quietly Brilliant",
      status: :live,
      started_on: ~D[2024-01-09],
      ended_on: :now,
      description:
        "Placeholder copy describing this project at a glance. " <>
          "Two-ish sentences feels about right for a card like this.",
      links: [
        %{label: "Site", url: "https://example.com"},
        %{label: "Read more", url: "https://example.com/about"}
      ],
      images: [
        %{src: "/images/projects/placeholder-5.svg", alt: "Quietly Brilliant 1"},
        %{src: "/images/projects/placeholder-6.svg", alt: "Quietly Brilliant 2"},
        %{src: "/images/projects/placeholder-7.svg", alt: "Quietly Brilliant 3"}
      ]
    },
    %{
      name: "Pocket Compass",
      status: :live,
      started_on: ~D[2022-08-30],
      ended_on: :now,
      description:
        "A small tool I keep coming back to. Placeholder description goes here. " <>
          "It's evolved a few times and I'm still finding new uses for it.",
      links: [
        %{label: "App Store", url: "https://example.com/app"},
        %{label: "Notes", url: "https://example.com/blog"}
      ],
      images: [
        %{src: "/images/projects/placeholder-1.svg", alt: "Pocket Compass 1"},
        %{src: "/images/projects/placeholder-2.svg", alt: "Pocket Compass 2"},
        %{src: "/images/projects/placeholder-3.svg", alt: "Pocket Compass 3"},
        %{src: "/images/projects/placeholder-4.svg", alt: "Pocket Compass 4"}
      ]
    },
    %{
      name: "Greenhouse Studio",
      status: :retired,
      started_on: ~D[2018-05-01],
      ended_on: ~D[2021-11-15],
      description:
        "Old creative experiment. Wrapped it up after a good run. " <>
          "Placeholder copy that will be swapped for the real story.",
      links: [
        %{label: "Archive", url: "https://example.com/archive"}
      ],
      images: [
        %{src: "/images/projects/placeholder-5.svg", alt: "Greenhouse 1"},
        %{src: "/images/projects/placeholder-6.svg", alt: "Greenhouse 2"},
        %{src: "/images/projects/placeholder-7.svg", alt: "Greenhouse 3"}
      ]
    },
    %{
      name: "Tatsu",
      status: :retired,
      started_on: ~D[2016-02-22],
      ended_on: ~D[2020-09-30],
      description:
        "Placeholder for a previous project that I learned a ton from. " <>
          "Not active anymore but the lessons stuck.",
      links: [
        %{label: "Write-up", url: "https://example.com/tatsu"},
        %{label: "Source", url: "https://github.com/example/tatsu"}
      ],
      images: [
        %{src: "/images/projects/placeholder-1.svg", alt: "Tatsu 1"},
        %{src: "/images/projects/placeholder-2.svg", alt: "Tatsu 2"},
        %{src: "/images/projects/placeholder-3.svg", alt: "Tatsu 3"},
        %{src: "/images/projects/placeholder-4.svg", alt: "Tatsu 4"}
      ]
    },
    %{
      name: "Field Notes",
      status: :live,
      started_on: ~D[2025-02-14],
      ended_on: :now,
      description:
        "Newer thing I'm building in the open. Placeholder description here. " <>
          "Still early but there's something to it.",
      links: [
        %{label: "Site", url: "https://example.com/field-notes"}
      ],
      images: [
        %{src: "/images/projects/placeholder-5.svg", alt: "Field Notes 1"},
        %{src: "/images/projects/placeholder-6.svg", alt: "Field Notes 2"},
        %{src: "/images/projects/placeholder-7.svg", alt: "Field Notes 3"}
      ]
    },
    %{
      name: "Kinship Beta",
      status: :retired,
      started_on: ~D[2019-09-01],
      ended_on: ~D[2023-03-30],
      description:
        "Placeholder summary of a community-focused project from a few years back. " <>
          "Closed it down, learned a lot, moved on.",
      links: [
        %{label: "Retro post", url: "https://example.com/kinship-retro"}
      ],
      images: [
        %{src: "/images/projects/placeholder-1.svg", alt: "Kinship 1"},
        %{src: "/images/projects/placeholder-2.svg", alt: "Kinship 2"},
        %{src: "/images/projects/placeholder-3.svg", alt: "Kinship 3"}
      ]
    },
    %{
      name: "Paper & Pixel",
      status: :retired,
      started_on: ~D[2014-06-12],
      ended_on: ~D[2017-12-31],
      description:
        "An older side project that mixed analog and digital. " <>
          "Placeholder copy until I write the real description.",
      links: [
        %{label: "Gallery", url: "https://example.com/paper-pixel"}
      ],
      images: [
        %{src: "/images/projects/placeholder-4.svg", alt: "Paper & Pixel 1"},
        %{src: "/images/projects/placeholder-5.svg", alt: "Paper & Pixel 2"},
        %{src: "/images/projects/placeholder-6.svg", alt: "Paper & Pixel 3"},
        %{src: "/images/projects/placeholder-7.svg", alt: "Paper & Pixel 4"}
      ]
    },
    %{
      name: "Signal Garden",
      status: :live,
      started_on: ~D[2024-10-01],
      ended_on: :now,
      description:
        "Recent thing that's been getting most of my attention. " <>
          "Placeholder description; the real one will be more interesting.",
      links: [
        %{label: "Site", url: "https://example.com/signal-garden"},
        %{label: "Twitter", url: "https://x.com/example"}
      ],
      images: [
        %{src: "/images/projects/placeholder-1.svg", alt: "Signal Garden 1"},
        %{src: "/images/projects/placeholder-2.svg", alt: "Signal Garden 2"},
        %{src: "/images/projects/placeholder-3.svg", alt: "Signal Garden 3"},
        %{src: "/images/projects/placeholder-4.svg", alt: "Signal Garden 4"}
      ]
    }
  ]
  |> Enum.map(&Project.build/1)
  |> Enum.sort_by(fn %Project{status: status, started_on: started_on} ->
    {if(status == :live, do: 0, else: 1), -Date.to_gregorian_days(started_on)}
  end)

  @doc """
  Returns all projects, sorted with `:live` projects first then by `started_on` desc.
  """
  def all_projects, do: @projects
end
