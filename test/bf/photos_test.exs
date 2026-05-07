defmodule BrilliantFantastic.PhotosTest do
  use ExUnit.Case, async: true

  alias BrilliantFantastic.Photos

  # Fixture names committed under priv/static/images/photos/{side}/
  # test-fixture-{a,b}-{480,960,1440,1920}.webp
  @fixture_name "test-fixture-a"

  describe "random/1" do
    test "returns a photo map for :brilliant with fixtures present" do
      photo = Photos.random(:brilliant)

      assert %{name: name, side: :brilliant} = photo
      assert is_binary(name)
      assert String.length(name) > 0
    end

    test "returns a photo map for :fantastic with fixtures present" do
      photo = Photos.random(:fantastic)

      assert %{name: name, side: :fantastic} = photo
      assert is_binary(name)
      assert String.length(name) > 0
    end
  end

  describe "srcset/1" do
    test "returns 4 comma-separated width entries" do
      photo = %{name: @fixture_name, side: :brilliant}
      result = Photos.srcset(photo)

      parts = String.split(result, ", ")
      assert length(parts) == 4
    end

    test "each entry follows the 'URL Nw' format" do
      photo = %{name: @fixture_name, side: :brilliant}
      result = Photos.srcset(photo)

      for entry <- String.split(result, ", ") do
        assert String.ends_with?(entry, "w"),
               "expected entry to end with 'w', got: #{inspect(entry)}"

        parts = String.split(entry, " ")
        assert length(parts) == 2
      end
    end

    test "URLs contain all four widths" do
      photo = %{name: @fixture_name, side: :brilliant}
      result = Photos.srcset(photo)

      assert result =~ "480w"
      assert result =~ "960w"
      assert result =~ "1440w"
      assert result =~ "1920w"
    end

    test "URLs follow the /images/photos/{side}/{name}-{width}.webp pattern" do
      photo = %{name: @fixture_name, side: :brilliant}
      result = Photos.srcset(photo)

      for width <- [480, 960, 1440, 1920] do
        expected_url = "/images/photos/brilliant/#{@fixture_name}-#{width}.webp #{width}w"
        assert result =~ expected_url
      end
    end

    test "uses correct side in URL for fantastic" do
      photo = %{name: @fixture_name, side: :fantastic}
      result = Photos.srcset(photo)

      assert result =~ "/images/photos/fantastic/#{@fixture_name}-480.webp"
    end
  end

  describe "src/1" do
    test "returns the 960w URL" do
      photo = %{name: @fixture_name, side: :brilliant}
      result = Photos.src(photo)

      assert result == "/images/photos/brilliant/#{@fixture_name}-960.webp"
    end

    test "uses correct side for fantastic" do
      photo = %{name: @fixture_name, side: :fantastic}
      result = Photos.src(photo)

      assert result == "/images/photos/fantastic/#{@fixture_name}-960.webp"
    end
  end

end
