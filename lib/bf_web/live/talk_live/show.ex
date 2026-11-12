defmodule BrilliantFantasticWeb.TalkLive.Show do
  use BrilliantFantasticWeb, :live_view

  alias BrilliantFantastic.Talks
  alias BrilliantFantasticWeb.TalkComponents

  import TalkComponents

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(%{"id" => id}, _uri, socket) do
    case Talks.get_talk_by_id(id) do
      nil ->
        {:noreply,
         socket
         |> put_flash(:error, "Talk not found")
         |> push_navigate(to: ~p"/")}

      talk ->
        {:noreply,
         socket
         |> assign(:talk, talk)
         |> assign(:page_title, "#{talk.title} · #{talk.event}")
         |> assign(:page_description, talk.summary)
         |> assign(:page_url_path, "/jamie/talks/#{talk.id}/thankyou")
         |> assign(:page_type, "website")}
    end
  end
end
