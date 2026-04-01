defmodule BrilliantFantastic.ContactNotifierTest do
  use ExUnit.Case, async: true

  import Swoosh.TestAssertions

  alias BrilliantFantastic.ContactForm
  alias BrilliantFantastic.ContactNotifier

  @contact %ContactForm{
    name: "Ada Lovelace",
    email: "ada@example.com",
    subject: "Collaboration inquiry",
    message: "I would love to discuss a potential project together."
  }

  describe "deliver_contact_message/1" do
    test "delivers email to the site owner" do
      ContactNotifier.deliver_contact_message(@contact)

      assert_email_sent(to: [{"Jamie Wright", "me@brilliantfantastic.com"}])
    end

    test "sets reply-to as the sender's name and email" do
      ContactNotifier.deliver_contact_message(@contact)

      assert_email_sent(reply_to: {"Ada Lovelace", "ada@example.com"})
    end

    test "uses the contact form subject as the email subject" do
      ContactNotifier.deliver_contact_message(@contact)

      assert_email_sent(subject: "Collaboration inquiry")
    end

    test "defaults subject when not provided" do
      contact = %{@contact | subject: nil}
      ContactNotifier.deliver_contact_message(contact)

      assert_email_sent(subject: "Message from ada@example.com on brilliantfantastic.com")
    end

    test "includes the sender's name, email, and message in the body" do
      ContactNotifier.deliver_contact_message(@contact)

      assert_email_sent(fn email ->
        assert email.text_body =~ "Ada Lovelace"
        assert email.text_body =~ "ada@example.com"
        assert email.text_body =~ "I would love to discuss a potential project together."
      end)
    end

    test "sends from the noreply address" do
      ContactNotifier.deliver_contact_message(@contact)

      assert_email_sent(from: {"Contact Form", "noreply@brilliantfantastic.com"})
    end
  end
end
