defmodule BrilliantFantastic.Projects do
  @moduledoc """
  Hardcoded list of projects shown on the /projects page.

  Order is preserved as written — no sorting is applied.
  """

  alias BrilliantFantastic.Projects.Project

  @projects [
              %{
                name: "Tatsu",
                status: :current,
                started_on: ~D[2014-10-26],
                ended_on: :now,
                description: """
                A native Slack app that helps teams get organized right where they work. Track tasks, gather feedback with polls, and keep in-sync with syncups.
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
                name: "Mixtape",
                status: :current,
                started_on: ~D[2025-12-31],
                ended_on: :now,
                description: """
                Every month since January 2018, I have created a playlist on Spotify that is the music that I discover that month.
                It's like a time capsule of music discovery and I wanted to automate it a bit.
                Mixtape is an app that connects to your Spotify or Apple Music and creates a time capsuled playlist when you favorite a song.
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
                name: "Juvet",
                status: :current,
                started_on: ~D[2018-03-09],
                ended_on: :now,
                description: """
                An open source Elixir library for building chatbots like web application frameworks such as Phoenix or Ruby on Rails.
                I built this as a necessity for building Tatsu and I thought others may benefit from it as well.
                """,
                links: [
                  %{label: "GitHub", url: "https://github.com/juvet/juvet"},
                  %{label: "Useless website", url: "https://juvet.io"}
                ],
                images: [
                  %{src: "/images/projects/placeholder-1.svg", alt: "Kinship 1"},
                  %{src: "/images/projects/placeholder-2.svg", alt: "Kinship 2"},
                  %{src: "/images/projects/placeholder-3.svg", alt: "Kinship 3"}
                ]
              },
              %{
                name: "The Standup Podcast",
                status: :hiatus,
                started_on: ~D[2017-01-09],
                ended_on: :now,
                description: """
                A podcast I do with my friend [Keith](https://github.com/keiththomps){: target="_blank"} about the software industry, development, and entrepreneurship.
                There are currently 79 episodes out, then we took a hiatus. Will we be back?
                """,
                links: [
                  %{
                    label: "Apple podcast",
                    url: "https://podcasts.apple.com/us/podcast/the-standup/id1193304664"
                  }
                ],
                images: [
                  %{src: "/images/projects/placeholder-1.svg", alt: "Kinship 1"},
                  %{src: "/images/projects/placeholder-2.svg", alt: "Kinship 2"},
                  %{src: "/images/projects/placeholder-3.svg", alt: "Kinship 3"}
                ]
              },
              %{
                name: "Chronic",
                status: :retired,
                started_on: ~D[2017-07-06],
                ended_on: ~D[2020-07-30],
                description: """
                My most ambitious tiny project. A web, mobile, and Mac app that displayed progress on a timer from a central server.
                I tried to build a pomodoro app that made it fun to do tasks together instead of just in silos.
                This made for a very fun project, I learned Elixir OTP, and I made a lot of content for speaking and writing.
                """,
                links: [
                  %{
                    label: "Podcast episode",
                    url:
                      "https://podcasts.apple.com/us/podcast/s4e17-i-really-hope-the-3rd-part-is-profit/id1193304664?i=1000486687250"
                  },
                  %{label: "Old launch page", url: "https://chronic.io"},
                  %{
                    label: "Beer City Code 2019 talk",
                    url: "https://speakerdeck.com/jwright/building-a-websocket-api"
                  }
                ],
                images: [
                  %{src: "/images/projects/placeholder-1.svg", alt: "Kinship 1"},
                  %{src: "/images/projects/placeholder-2.svg", alt: "Kinship 2"},
                  %{src: "/images/projects/placeholder-3.svg", alt: "Kinship 3"}
                ]
              },
              %{
                name: "Lebotski",
                status: :retired,
                started_on: ~D[2022-08-17],
                ended_on: ~D[2022-08-29],
                description: """
                An open source Slack app that really ties Slack together by helping users find cocktail bars, bowling alleys, and dispensaries near a location.
                It was an example app built on Juvet for a talk I gave at nerd conferences.
                """,
                links: [
                  %{label: "GitHub", url: "https://github.com/jwright/lebotski"},
                  %{
                    label: "ElixirConf 2022 talk",
                    url: "https://www.youtube.com/watch?v=FyRLeAggi6o"
                  }
                ],
                images: [
                  %{src: "/images/projects/placeholder-1.svg", alt: "Kinship 1"},
                  %{src: "/images/projects/placeholder-2.svg", alt: "Kinship 2"},
                  %{src: "/images/projects/placeholder-3.svg", alt: "Kinship 3"}
                ]
              },
              %{
                name: "Kinship",
                status: :retired,
                started_on: ~D[2018-03-07],
                ended_on: ~D[2019-02-18],
                description: """
                I wanted to try my hand at building a larger agency with friends and I failed.
                I thought just the magic formula of getting the best people would be the simple recipe to success.
                We launched with a big bang, did some really fun work, but it went out with a whimper. I found I like small.
                """,
                links: [
                  %{label: "Blog post", url: "/blog/i-left-kinship"},
                  %{
                    label: "Old website",
                    url: "https://web.archive.org/web/20220119120639/https://kinship.it"
                  }
                ],
                images: [
                  %{src: "/images/projects/placeholder-1.svg", alt: "Kinship 1"},
                  %{src: "/images/projects/placeholder-2.svg", alt: "Kinship 2"},
                  %{src: "/images/projects/placeholder-3.svg", alt: "Kinship 3"}
                ]
              },
              %{
                name: "Seed Coworking",
                status: :retired,
                started_on: ~D[2012-03-27],
                ended_on: ~D[2020-12-31],
                description: """
                I co-founded Toledo Ohio's first coworking space with two other buddies back in 2012. We funded it via a small infusion of cash and a successful Kickstarter campaign.
                It was a wild ride and I learned a ton about community, physical businesses, and myself. A Covid casualty but I'm proud of what we built.
                """,
                links: [
                  %{
                    label: "Original Kickstarter",
                    url:
                      "https://www.kickstarter.com/projects/seedcowork/seed-coworking-community"
                  },
                  %{
                    label: "Local news story",
                    url:
                      "https://www.toledoblade.com/business/Economy/2013/03/20/Seed-Coworking-offers-place-to-put-heads-ideas-together/stories/20130319204"
                  }
                ],
                images: [
                  %{src: "/images/projects/placeholder-5.svg", alt: "Quietly Brilliant 1"},
                  %{src: "/images/projects/placeholder-6.svg", alt: "Quietly Brilliant 2"},
                  %{src: "/images/projects/placeholder-7.svg", alt: "Quietly Brilliant 3"}
                ]
              },
              %{
                name: "Delicious Training",
                status: :retired,
                started_on: ~D[2013-09-09],
                ended_on: ~D[2014-03-30],
                description: """
                Live in-person training events with myself and [Keith](https://github.com/keiththomps){: target="_blank"}, who was an employee at the time, for software developers interested in Ruby on Rails.
                I have a love for teaching and I decided to do workshops after years of speaking.
                It went amazingly delicious, we got a lot of great feedback, and some graduates even got Ruby jobs. 🤘
                We poured so much time into this and built a [whole new app](https://github.com/brilliantfantastic/magpie){: target="_blank"} with the class but we only gave this training a handful of times.
                """,
                links: [
                  %{
                    label: "Old training site",
                    url: "https://bfantastic.herokuapp.com/training"
                  },
                  %{
                    label: "App we built",
                    url: "https://github.com/brilliantfantastic/magpie"
                  }
                ],
                images: [
                  %{src: "/images/projects/placeholder-1.svg", alt: "Kinship 1"},
                  %{src: "/images/projects/placeholder-2.svg", alt: "Kinship 2"},
                  %{src: "/images/projects/placeholder-3.svg", alt: "Kinship 3"}
                ]
              },
              %{
                name: "Callback",
                status: :retired,
                started_on: ~D[2016-12-10],
                ended_on: ~D[2022-12-03],
                description: """
                A web app for developers to schedule webhooks like cron jobs.
                I got sick of building the same background job system that took into account timezone changes and so I built it and made it into a service for all to use.
                """,
                links: [
                  %{
                    label: "Wayback Machine cached launch page",
                    url: "https://web.archive.org/web/20221223073826/http://callback.run/"
                  }
                ],
                images: [
                  %{src: "/images/projects/placeholder-1.svg", alt: "Kinship 1"},
                  %{src: "/images/projects/placeholder-2.svg", alt: "Kinship 2"},
                  %{src: "/images/projects/placeholder-3.svg", alt: "Kinship 3"}
                ]
              },
              %{
                name: "Funnelcake",
                status: :retired,
                started_on: ~D[2013-10-11],
                ended_on: ~D[2014-05-26],
                description: """
                A new chat application that focused on human and bot interactions in threaded conversations.
                Then I started hearing about this new startup called Slack.
                """,
                links: [
                  %{
                    label: "How I learned about Slack",
                    url:
                      "https://www.fastcompany.com/3015730/flickr-cofounders-launch-slack-an-email-killer"
                  }
                ],
                images: [
                  %{src: "/images/projects/placeholder-1.svg", alt: "Kinship 1"},
                  %{src: "/images/projects/placeholder-2.svg", alt: "Kinship 2"},
                  %{src: "/images/projects/placeholder-3.svg", alt: "Kinship 3"}
                ]
              },
              %{
                name: "Lookbooth",
                status: :retired,
                started_on: ~D[2013-01-28],
                ended_on: ~D[2013-05-05],
                description: """
                A web and desktop application that enabled photographers to upload photos they took at weddings or any other event so the attendees could download them.
                It was a fun software-adjacent business. It was short-lived since my business partners took off with all the money from the events we had. Cool.
                """,
                links: [
                  %{
                    label: "Photo from Star Wars night",
                    url:
                      "https://s3.us-east-1.amazonaws.com/production.lookbooth/photos/aweber/toledo-mud-hens-vs-charlotte-knights--2/050513.6393.gallery.JPG"
                  }
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
                started_on: ~D[2012-07-11],
                ended_on: ~D[2012-10-16],
                description: """
                I got tired of entering calendar information for my kids events when I knew there were others that already did it and I just wanted to copy theirs.
                Koki was a web app that contained a marketplace of shared calendars so you could simple import calendars and events you cared about.
                I did not really know how to sell this and so I abandoned it but I still think it's a great idea.
                """,
                links: [
                  %{
                    label: "Interesting calendars",
                    url: "https://www.schedjoules.com/"
                  },
                  %{
                    label: "The Japanese calendar",
                    url:
                      "https://en.wikipedia.org/wiki/Japanese_calendar#Japanese_imperial_years_(k%C5%8Dki_or_kigen)"
                  }
                ],
                images: [
                  %{src: "/images/projects/placeholder-1.svg", alt: "Tatsu 1"},
                  %{src: "/images/projects/placeholder-2.svg", alt: "Tatsu 2"},
                  %{src: "/images/projects/placeholder-3.svg", alt: "Tatsu 3"},
                  %{src: "/images/projects/placeholder-4.svg", alt: "Tatsu 4"}
                ]
              },
              %{
                name: "Morale",
                status: :retired,
                started_on: ~D[2008-04-23],
                ended_on: ~D[2013-01-12],
                description: """
                A web app that allowed you to create tasks using natural language within a magic textbox.
                My first foray into SaaS and the first software product I launched.
                """,
                links: [
                  %{
                    label: "Wayback Machine cached page",
                    url: "https://web.archive.org/web/20140106184051/http://teammorale.com/"
                  },
                  %{label: "Old Twitter account", url: "https://twitter.com/morale"}
                ],
                images: [
                  %{src: "/images/projects/placeholder-1.svg", alt: "Pocket Compass 1"},
                  %{src: "/images/projects/placeholder-2.svg", alt: "Pocket Compass 2"},
                  %{src: "/images/projects/placeholder-3.svg", alt: "Pocket Compass 3"},
                  %{src: "/images/projects/placeholder-4.svg", alt: "Pocket Compass 4"}
                ]
              },
              %{
                name: "machinegobrrr",
                status: :upcoming,
                started_on: ~D[2026-04-04],
                ended_on: :now,
                description: """
                My agentic-programming workflow in a cli-tool.
                """,
                links: [
                  %{label: "Future home", url: "https://machinegobrrr.com"}
                ],
                images: [
                  %{src: "/images/projects/placeholder-1.svg", alt: "Kinship 1"},
                  %{src: "/images/projects/placeholder-2.svg", alt: "Kinship 2"},
                  %{src: "/images/projects/placeholder-3.svg", alt: "Kinship 3"}
                ]
              },
              %{
                name: "Aisleway",
                status: :upcoming,
                started_on: ~D[2026-02-09],
                ended_on: :now,
                description: """
                A mobile and voice app as a present to my wife.
                Everyone hates grocery shopping and my wife does the majority of it. It's time for AI to do this shit instead of pretending to 'create art'.
                """,
                links: [
                  %{label: "Future home", url: "https://aisleway.com"}
                ],
                images: [
                  %{src: "/images/projects/placeholder-1.svg", alt: "Kinship 1"},
                  %{src: "/images/projects/placeholder-2.svg", alt: "Kinship 2"},
                  %{src: "/images/projects/placeholder-3.svg", alt: "Kinship 3"}
                ]
              },
              %{
                name: "Scream Machine",
                status: :upcoming,
                started_on: ~D[2026-02-11],
                ended_on: :now,
                description: """
                A hardware/software expieriment to build a sound proof booth to measure the strength of your screams.
                Everyone needs this because of all the \*waves hands in all directions\*.
                A cathartic measurement device for the apocalypse.
                Coming to a street corner near you soon-ish.
                """,
                links: [
                  %{
                    label: "Parts list",
                    url:
                      "https://github.com/brilliantfantastic/scream_machine/blob/main/docs/SHOPPING-LIST.md"
                  }
                ],
                images: [
                  %{src: "/images/projects/placeholder-1.svg", alt: "Kinship 1"},
                  %{src: "/images/projects/placeholder-2.svg", alt: "Kinship 2"},
                  %{src: "/images/projects/placeholder-3.svg", alt: "Kinship 3"}
                ]
              }
            ]
            |> Enum.map(&Project.build/1)

  @doc """
  Returns all projects in the order defined in the module — no sorting applied.
  """
  def all_projects, do: @projects
end
