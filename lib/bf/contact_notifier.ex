defmodule BrilliantFantastic.ContactNotifier do
  import Swoosh.Email

  alias BrilliantFantastic.Mailer

  def deliver_contact_message(%BrilliantFantastic.ContactForm{} = contact) do
    new()
    |> to({"Jamie Wright", "me@brilliantfantastic.com"})
    |> from({"Contact Form", "noreply@brilliantfantastic.com"})
    |> reply_to({contact.name, contact.email})
    |> subject(contact.subject)
    |> text_body("""
    New contact form submission from #{contact.name} (#{contact.email}):

    #{contact.message}
    """)
    |> Mailer.deliver()
  end
end
