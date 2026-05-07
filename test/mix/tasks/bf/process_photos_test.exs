defmodule Mix.Tasks.Bf.ProcessPhotosTest do
  use ExUnit.Case, async: false

  # Mix task tests cannot run async: true because Mix.shell() is process-global.

  setup do
    # Capture Mix shell output via Process messages
    Mix.shell(Mix.Shell.Process)
    on_exit(fn -> Mix.shell(Mix.Shell.IO) end)

    # Unique tmp dirs so parallel test runs (non-async here, but future-safe)
    token = :crypto.strong_rand_bytes(8) |> Base.encode16()
    tmp_root = Path.join(System.tmp_dir!(), "bf_photo_test_#{token}")
    tmp_source = Path.join(tmp_root, "source")
    tmp_output = Path.join(tmp_root, "output")

    # Create source dir for brilliant side with a tiny test JPG
    source_brilliant = Path.join(tmp_source, "brilliant")
    File.mkdir_p!(source_brilliant)

    # Generate a tiny 20×20 solid-color JPG via the image library
    Application.ensure_all_started(:image)
    {:ok, img} = Image.new(20, 20, color: [100, 150, 200])
    source_jpg = Path.join(source_brilliant, "test-photo.jpg")
    {:ok, _} = Image.write(img, source_jpg)

    on_exit(fn ->
      File.rm_rf!(tmp_root)
    end)

    {:ok,
     tmp_source: tmp_source,
     tmp_output: tmp_output,
     source_jpg: source_jpg,
     source_brilliant: source_brilliant}
  end

  defp drain_shell_messages do
    receive do
      {:mix_shell, _, _} -> drain_shell_messages()
    after
      0 -> :ok
    end
  end

  defp collect_shell_messages do
    collect_shell_messages([])
  end

  defp collect_shell_messages(acc) do
    receive do
      {:mix_shell, :info, [msg]} -> collect_shell_messages([msg | acc])
      {:mix_shell, :error, [msg]} -> collect_shell_messages([{:error, msg} | acc])
    after
      100 -> Enum.reverse(acc)
    end
  end

  test "generates WebP output for a single width", %{
    tmp_source: tmp_source,
    tmp_output: tmp_output
  } do
    drain_shell_messages()

    Mix.Tasks.Bf.ProcessPhotos.run([
      "--source", tmp_source,
      "--output", tmp_output,
      "--widths", "480"
    ])

    expected_webp = Path.join([tmp_output, "brilliant", "test-photo-480.webp"])
    assert File.exists?(expected_webp),
           "expected #{expected_webp} to exist after processing"
  end

  test "logs a success message after processing", %{
    tmp_source: tmp_source,
    tmp_output: tmp_output
  } do
    drain_shell_messages()

    Mix.Tasks.Bf.ProcessPhotos.run([
      "--source", tmp_source,
      "--output", tmp_output,
      "--widths", "480"
    ])

    messages = collect_shell_messages()

    assert Enum.any?(messages, fn msg ->
             is_binary(msg) and msg =~ "test-photo.jpg"
           end),
           "expected a success log mentioning test-photo.jpg, got: #{inspect(messages)}"
  end

  test "skips already-up-to-date files on re-run (idempotency)", %{
    tmp_source: tmp_source,
    tmp_output: tmp_output
  } do
    args = ["--source", tmp_source, "--output", tmp_output, "--widths", "480"]

    drain_shell_messages()
    Mix.Tasks.Bf.ProcessPhotos.run(args)
    drain_shell_messages()

    # Re-run — file is now up to date
    Mix.Tasks.Bf.ProcessPhotos.run(args)
    messages = collect_shell_messages()

    assert Enum.any?(messages, fn msg ->
             is_binary(msg) and msg =~ "skipped"
           end),
           "expected a skip log on re-run, got: #{inspect(messages)}"
  end

  test "--force re-processes even when output is up to date", %{
    tmp_source: tmp_source,
    tmp_output: tmp_output
  } do
    base_args = ["--source", tmp_source, "--output", tmp_output, "--widths", "480"]

    drain_shell_messages()
    Mix.Tasks.Bf.ProcessPhotos.run(base_args)
    drain_shell_messages()

    # Force re-run
    Mix.Tasks.Bf.ProcessPhotos.run(base_args ++ ["--force"])
    messages = collect_shell_messages()

    # Should log a success/variant line (not a skip)
    assert Enum.any?(messages, fn msg ->
             is_binary(msg) and msg =~ "variant"
           end),
           "expected a variant log with --force, got: #{inspect(messages)}"

    refute Enum.any?(messages, fn msg ->
             is_binary(msg) and msg =~ "skipped"
           end),
           "expected no skip log with --force, got: #{inspect(messages)}"
  end
end
