defmodule BrilliantFantasticWeb.TalkController do
  @moduledoc """
  Short talk URLs for slides and QR codes.

    * `/jamie/talks/:id` permanently redirects to the talk's thank-you page,
      which handles unknown ids itself.
    * `/:year/:event` (e.g. `/2026/exmex`) is the shortest form. It maps to the
      talk whose id is `"<year>-<event>"` (`priv/talks/2026-exmex.md`) and
      redirects to its thank-you page. Anything that isn't a four-digit year
      and a published talk is a 404, so this catch-all route can't swallow
      other two-segment paths.
  """
  use BrilliantFantasticWeb, :controller

  alias BrilliantFantastic.Talks

  defmodule NotFoundError do
    defexception message: "talk not found", plug_status: 404
  end

  def show(conn, %{"id" => id}) do
    conn
    |> put_status(:moved_permanently)
    |> redirect(to: ~p"/jamie/talks/#{id}/thankyou")
  end

  # A temporary (302) redirect: the short link is printed on slides and in QR
  # codes, so browsers shouldn't cache where it points.
  def short(conn, %{"year" => year, "event" => event}) do
    id = "#{year}-#{event}"

    if year =~ ~r/\A\d{4}\z/ and Talks.get_talk_by_id(id) do
      redirect(conn, to: ~p"/jamie/talks/#{id}/thankyou")
    else
      raise NotFoundError
    end
  end
end
