defmodule BrilliantFantastic.Talks.TalkTest do
  use ExUnit.Case, async: true

  alias BrilliantFantastic.Talks.Talk

  @attrs %{
    title: "The Talk Title",
    event: "ExMex 2026",
    summary: "One line for the meta description.",
    date: "2026-11-05",
    published: true
  }

  defp build(extra \\ %{}) do
    Talk.build("priv/talks/2026-exmex.md", Map.merge(@attrs, extra), "<p>body</p>")
  end

  describe "build/3 id" do
    test "takes the id from the filename stem" do
      talk = build()
      assert talk.id == "2026-exmex"
    end

    test "stores the filename" do
      talk = build()
      assert talk.filename == "2026-exmex.md"
    end
  end

  describe "build/3 defaults" do
    test "defaults published to false when omitted" do
      talk = Talk.build("priv/talks/draft.md", Map.delete(@attrs, :published), "<p>body</p>")
      assert talk.published == false
    end

    test "defaults sections to [:hire, :projects, :recent_posts] when omitted" do
      talk = build(Map.delete(@attrs, :sections))
      assert talk.sections == [:hire, :projects, :recent_posts]
    end

    test "respects an explicit published value" do
      talk = build(%{published: false})
      assert talk.published == false
    end
  end

  describe "build/3 date" do
    test "parses the date string into a Date" do
      talk = build()
      assert talk.date == ~D[2026-11-05]
    end

    test "raises on an invalid date string" do
      assert_raise ArgumentError, fn ->
        build(%{date: "not-a-date"})
      end
    end
  end

  describe "build/3 optional fields" do
    test "optional fields default to nil" do
      talk = build()
      assert talk.event_url == nil
      assert talk.location == nil
      assert talk.speakerdeck_id == nil
      assert talk.slides_url == nil
    end

    test "optional fields can be set" do
      talk =
        build(%{
          event_url: "https://example.com",
          location: "Mexico City",
          speakerdeck_id: "abc123",
          slides_url: "https://speakerdeck.com/jwright/test"
        })

      assert talk.event_url == "https://example.com"
      assert talk.location == "Mexico City"
      assert talk.speakerdeck_id == "abc123"
      assert talk.slides_url == "https://speakerdeck.com/jwright/test"
    end
  end

  describe "build/3 sections validation" do
    test "accepts all four allowed sections" do
      talk = build(%{sections: [:hire, :projects, :recent_posts, :contact]})
      assert talk.sections == [:hire, :projects, :recent_posts, :contact]
    end

    test "preserves the order of sections" do
      talk = build(%{sections: [:contact, :hire]})
      assert talk.sections == [:contact, :hire]
    end

    test "raises on an unknown section atom" do
      assert_raise ArgumentError, ~r/unknown sections/, fn ->
        build(%{sections: [:hire, :invalid_section]})
      end
    end

    test "names the offending file and bad value in the error" do
      assert_raise ArgumentError, ~r/2026-exmex\.md.*:invalid_section/, fn ->
        build(%{sections: [:invalid_section]})
      end
    end

    test "raises when sections is not a list" do
      assert_raise ArgumentError, ~r/must be a list/, fn ->
        build(%{sections: :hire})
      end
    end

    test "names the offending file when sections is not a list" do
      assert_raise ArgumentError, ~r/2026-exmex\.md/, fn ->
        build(%{sections: :hire})
      end
    end
  end

  describe "build/3 required keys" do
    test "raises when title is missing" do
      assert_raise ArgumentError, ~r/:title/, fn ->
        Talk.build("priv/talks/2026-exmex.md", Map.delete(@attrs, :title), "<p>body</p>")
      end
    end

    test "raises when event is missing" do
      assert_raise ArgumentError, ~r/:event/, fn ->
        Talk.build("priv/talks/2026-exmex.md", Map.delete(@attrs, :event), "<p>body</p>")
      end
    end

    test "raises when summary is missing" do
      assert_raise ArgumentError, ~r/:summary/, fn ->
        Talk.build("priv/talks/2026-exmex.md", Map.delete(@attrs, :summary), "<p>body</p>")
      end
    end

    test "raises when date is missing" do
      assert_raise ArgumentError, ~r/:date/, fn ->
        Talk.build("priv/talks/2026-exmex.md", Map.delete(@attrs, :date), "<p>body</p>")
      end
    end
  end

  describe "sections/0" do
    test "returns the four allowed section atoms" do
      assert Talk.sections() == [:hire, :projects, :recent_posts, :contact]
    end
  end
end
