defmodule BrilliantFantasticWeb.TalkComponentsTest do
  use ExUnit.Case, async: true

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

  describe "talk_section :hire when not available for hire" do
    setup do
      previous = Application.get_env(:bf, :available_for_hire)
      Application.put_env(:bf, :available_for_hire, false)
      on_exit(fn -> Application.put_env(:bf, :available_for_hire, previous) end)

      html =
        render_component(&TalkComponents.talk_section/1,
          name: :hire,
          talk: %{event: "ExMex 2026"}
        )

      %{document: LazyHTML.from_fragment(html)}
    end

    test "offers separate question and work emails to the same address", %{document: document} do
      to = Application.get_env(:bf, :contact_to_email)

      question = href(document, "#talk-contact-question")
      work = href(document, "#talk-contact-work")

      assert question =~ ~r/^mailto:#{Regex.escape(to)}\?subject=/
      assert work =~ ~r/^mailto:#{Regex.escape(to)}\?subject=/
      refute subject(question) == subject(work)
    end

    test "puts the talk's event in both subjects", %{document: document} do
      assert subject(href(document, "#talk-contact-question")) =~ "ExMex 2026"
      assert subject(href(document, "#talk-contact-work")) =~ "ExMex 2026"
    end
  end

  defp href(document, selector) do
    [href] = document |> LazyHTML.query(selector) |> LazyHTML.attribute("href")
    href
  end

  defp subject(mailto) do
    %URI{query: query} = URI.parse(mailto)
    query |> URI.decode_query() |> Map.fetch!("subject")
  end
end
