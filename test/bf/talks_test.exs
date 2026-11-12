defmodule BrilliantFantastic.TalksTest do
  use ExUnit.Case, async: true

  alias BrilliantFantastic.Talks

  describe "all_talks/0" do
    test "returns talks sorted newest first" do
      talks = Talks.all_talks()
      assert [_ | _] = talks

      dates = Enum.map(talks, & &1.date)
      assert dates == Enum.sort(dates, {:desc, Date})
    end

    test "talks have required fields populated" do
      for talk <- Talks.all_talks() do
        assert talk.id
        assert talk.title
        assert talk.event
        assert talk.summary
        assert talk.date
        assert is_boolean(talk.published)
        assert talk.body
      end
    end
  end

  describe "published_talks/0" do
    test "returns only published talks" do
      talks = Talks.published_talks()

      for talk <- talks do
        assert talk.published == true
      end
    end

    test "returns talks sorted newest first" do
      talks = Talks.published_talks()
      dates = Enum.map(talks, & &1.date)
      assert dates == Enum.sort(dates, {:desc, Date})
    end
  end

  describe "get_talk_by_id/1" do
    test "returns a published talk when found" do
      [talk | _] = Talks.published_talks()
      found = Talks.get_talk_by_id(talk.id)
      assert found.id == talk.id
      assert found.title == talk.title
    end

    test "returns nil when id does not exist" do
      assert Talks.get_talk_by_id("nonexistent-talk-id") == nil
    end

    test "returns nil for an unpublished talk" do
      unpublished = Talks.all_talks() |> Enum.find(&(&1.published == false))

      if unpublished do
        assert Talks.get_talk_by_id(unpublished.id) == nil
      end
    end
  end
end
