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
end
