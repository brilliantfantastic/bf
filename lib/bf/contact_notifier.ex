defmodule BrilliantFantastic.ContactNotifier do
  @moduledoc """
  Delivers contact form submissions via email.
  """

  import Swoosh.Email

  alias BrilliantFantastic.Mailer

  def deliver_contact_message(%BrilliantFantastic.ContactForm{} = contact) do
    to_email = Application.get_env(:bf, :contact_to_email)
    to_name = Application.get_env(:bf, :contact_to_name)
    from_email = Application.get_env(:bf, :contact_from_email)
    from_name = Application.get_env(:bf, :contact_from_name)

    subject_line =
      if contact.subject && contact.subject != "",
        do: contact.subject,
        else: "Message from #{contact.email} on #{domain(to_email)}"

    new()
    |> to({to_name, to_email})
    |> from({from_name, from_email})
    |> reply_to({contact.name, contact.email})
    |> subject(subject_line)
    |> text_body("""
    New contact form submission from #{contact.name} (#{contact.email}):

    #{contact.message}
    """)
    |> Mailer.deliver()
  end

  defp domain(email), do: email |> String.split("@") |> List.last()
end
