defmodule BrilliantFantasticWeb.TalkController do
  @moduledoc """
  Short talk URLs. `/jamie/talks/:id` is what goes on the last slide;
  it permanently redirects to the talk's thank-you page, which handles
  unknown ids itself.
  """
  use BrilliantFantasticWeb, :controller

  def show(conn, %{"id" => id}) do
    conn
    |> put_status(:moved_permanently)
    |> redirect(to: ~p"/jamie/talks/#{id}/thankyou")
  end
end
