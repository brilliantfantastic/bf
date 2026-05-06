defmodule BrilliantFantasticWeb.ProjectHTML do
  use BrilliantFantasticWeb, :html

  embed_templates "project_html/*"

  @doc """
  Formats a project timeline as `MMM YYYY → MMM YYYY` or `MMM YYYY → now`.
  """
  def format_timeline(%Date{} = started_on, :now) do
    "#{format_date(started_on)} → now"
  end

  def format_timeline(%Date{} = started_on, %Date{} = ended_on) do
    "#{format_date(started_on)} → #{format_date(ended_on)}"
  end

  defp format_date(%Date{} = date) do
    Calendar.strftime(date, "%b %Y")
  end
end
