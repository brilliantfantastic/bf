defmodule BrilliantFantastic.Projects do
  @moduledoc """
  Hardcoded list of projects shown on the /projects page.

  Placeholder content for now — real projects, copy, and images come later.
  """

  alias BrilliantFantastic.Projects.Project

  @projects [
              %{
                name: "Mixtape",
                status: :live,
                started_on: ~D[2025-12-31],
                ended_on: :now,
                description: """
                Every month since January 2018, I have created a playlist on Spotify that is just music that I discover that month.
                It's like a time capsule of music discovery and I wanted to make it automatic.
                Mixtape is a web app that connects to your Spotify or Apple Music and creates a time capsuled playlist when you favorite a song.
                It's a dope-ass passion project that scratches my love of music.
                """,
                links: [
                  %{label: "Check it out", url: "https://tape.mx"}
                ],
                images: [
                  %{src: "/images/projects/placeholder-1.svg", alt: "Lorem Atlas screenshot 1"},
                  %{src: "/images/projects/placeholder-2.svg", alt: "Lorem Atlas screenshot 2"},
                  %{src: "/images/projects/placeholder-3.svg", alt: "Lorem Atlas screenshot 3"},
                  %{src: "/images/projects/placeholder-4.svg", alt: "Lorem Atlas logo"}
                ]
              },
              %{
                name: "Tatsu",
                status: :live,
                started_on: ~D[2014-10-26],
                ended_on: :now,
                description: """
                A native Slack app that helps teams get organized right in Slack. Track tasks, gather feedback with polls, and keep in-sync with syncups.
                Kill the meeting and keep work moving.
                """,
                links: [
                  %{label: "Website", url: "https://tatsu.io"},
                  %{label: "Slack App", url: "https://slack.com/marketplace/A0EP69E58-tatsu"}
                ],
                images: [
                  %{src: "/images/projects/placeholder-5.svg", alt: "Field Notes 1"},
                  %{src: "/images/projects/placeholder-6.svg", alt: "Field Notes 2"},
                  %{src: "/images/projects/placeholder-7.svg", alt: "Field Notes 3"}
                ]
              },
              %{
                name: "Seed Coworking",
                status: :retired,
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
                name: "Morale",
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
                name: "Lookbooth",
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
                name: "Koki",
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
                name: "Kinship",
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
                name: "Juvet",
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
                name: "Brilliant Fantastic Training",
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
