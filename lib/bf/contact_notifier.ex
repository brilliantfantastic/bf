defmodule BrilliantFantastic.ContactNotifier do
  import Swoosh.Email

  alias BrilliantFantastic.Mailer

  def deliver_contact_message(%BrilliantFantastic.ContactForm{} = contact) do
    subject_line =
      if contact.subject && contact.subject != "",
        do: contact.subject,
        else: "Message from #{contact.email} on brilliantfantastic.com"

    new()
    |> to({"Jamie Wright", "me@brilliantfantastic.com"})
    |> from({"Contact Form", "noreply@brilliantfantastic.com"})
    |> reply_to({contact.name, contact.email})
    |> subject(subject_line)
    |> text_body("""
    New contact form submission from #{contact.name} (#{contact.email}):

    #{contact.message}
    """)
    |> Mailer.deliver()
  end
end
