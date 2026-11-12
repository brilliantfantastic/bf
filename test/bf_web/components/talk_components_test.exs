defmodule BrilliantFantasticWeb.TalkComponentsTest do
  # Not async: the :hire tests flip the global :available_for_hire config.
  use ExUnit.Case, async: false

  import Phoenix.LiveViewTest

  alias BrilliantFantasticWeb.TalkComponents

  test "talk_slides shows a placeholder when the talk has no speakerdeck_id" do
    html =
      render_component(&TalkComponents.talk_slides/1,
        talk: %{title: "A talk", speakerdeck_id: nil, slides_url: nil}
      )

    document = LazyHTML.from_fragment(html)

    refute Enum.empty?(LazyHTML.query(document, "#talk-slides-placeholder"))
    assert Enum.empty?(LazyHTML.query(document, "iframe"))
  end

  for available <- [true, false] do
    describe "talk_section :hire with available_for_hire #{available}" do
      setup do
        previous = Application.get_env(:bf, :available_for_hire)
        Application.put_env(:bf, :available_for_hire, unquote(available))
        on_exit(fn -> Application.put_env(:bf, :available_for_hire, previous) end)

        html =
          render_component(&TalkComponents.talk_section/1,
            name: :hire,
            talk: %{event: "ExMex 2026"}
          )

        %{document: LazyHTML.from_fragment(html)}
      end

      test "links both cards to the contact form with different subjects", %{document: document} do
        question = href(document, "#talk-contact-question")
        opportunity = href(document, "#talk-contact-opportunity")

        for link <- [question, opportunity] do
          assert %URI{path: "/", fragment: "contact"} = URI.parse(link)
        end

        refute subject(question) == subject(opportunity)
      end

      test "puts the talk's event in both subjects", %{document: document} do
        assert subject(href(document, "#talk-contact-question")) =~ "ExMex 2026"
        assert subject(href(document, "#talk-contact-opportunity")) =~ "ExMex 2026"
      end

      test "does not put an email address in the page", %{document: document} do
        assert Enum.empty?(LazyHTML.query(document, ~s(a[href^="mailto:"])))
      end
    end
  end

  defp href(document, selector) do
    [href] = document |> LazyHTML.query(selector) |> LazyHTML.attribute("href")
    href
  end

  defp subject(link) do
    %URI{query: query} = URI.parse(link)
    query |> URI.decode_query() |> Map.fetch!("subject")
  end
end
