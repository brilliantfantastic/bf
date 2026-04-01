defmodule BrilliantFantastic.ContactFormTest do
  use ExUnit.Case, async: true

  alias BrilliantFantastic.ContactForm

  import BrilliantFantastic.DataCase, only: [errors_on: 1]

  @valid_attrs %{
    name: "Jane Doe",
    email: "jane@example.com",
    subject: "Hello there",
    message: "This is a valid message with enough length."
  }

  describe "changeset/2 with valid data" do
    test "returns a valid changeset when all required fields are provided" do
      changeset = ContactForm.changeset(%ContactForm{}, @valid_attrs)

      assert changeset.valid?
    end
  end

  describe "changeset/2 required fields" do
    test "requires name" do
      changeset = ContactForm.changeset(%ContactForm{}, Map.delete(@valid_attrs, :name))

      refute changeset.valid?
      assert "can't be blank" in errors_on(changeset).name
    end

    test "requires email" do
      changeset = ContactForm.changeset(%ContactForm{}, Map.delete(@valid_attrs, :email))

      refute changeset.valid?
      assert "can't be blank" in errors_on(changeset).email
    end

    test "does not require subject" do
      changeset = ContactForm.changeset(%ContactForm{}, Map.delete(@valid_attrs, :subject))

      assert changeset.valid?
    end

    test "requires message" do
      changeset = ContactForm.changeset(%ContactForm{}, Map.delete(@valid_attrs, :message))

      refute changeset.valid?
      assert "can't be blank" in errors_on(changeset).message
    end
  end

  describe "changeset/2 email format validation" do
    test "rejects email without @" do
      changeset = ContactForm.changeset(%ContactForm{}, %{@valid_attrs | email: "invalid-email"})

      refute changeset.valid?
      assert "has invalid format" in errors_on(changeset).email
    end

    test "rejects email without domain" do
      changeset = ContactForm.changeset(%ContactForm{}, %{@valid_attrs | email: "user@"})

      refute changeset.valid?
      assert "has invalid format" in errors_on(changeset).email
    end

    test "rejects email without TLD" do
      changeset = ContactForm.changeset(%ContactForm{}, %{@valid_attrs | email: "user@domain"})

      refute changeset.valid?
      assert "has invalid format" in errors_on(changeset).email
    end

    test "accepts a standard email address" do
      changeset = ContactForm.changeset(%ContactForm{}, %{@valid_attrs | email: "user@domain.com"})

      assert changeset.valid?
    end

    test "accepts an email with subdomains" do
      changeset =
        ContactForm.changeset(%ContactForm{}, %{@valid_attrs | email: "user@mail.domain.co.uk"})

      assert changeset.valid?
    end
  end

  describe "changeset/2 message minimum length" do
    test "rejects message shorter than 10 characters" do
      changeset = ContactForm.changeset(%ContactForm{}, %{@valid_attrs | message: "Too short"})

      refute changeset.valid?
      assert "should be at least 10 character(s)" in errors_on(changeset).message
    end

    test "accepts message with exactly 10 characters" do
      changeset = ContactForm.changeset(%ContactForm{}, %{@valid_attrs | message: "Exactly 10"})

      assert changeset.valid?
    end
  end

  describe "changeset/2 max length constraints" do
    test "rejects name longer than 200 characters" do
      long_name = String.duplicate("a", 201)
      changeset = ContactForm.changeset(%ContactForm{}, %{@valid_attrs | name: long_name})

      refute changeset.valid?
      assert "should be at most 200 character(s)" in errors_on(changeset).name
    end

    test "rejects email longer than 254 characters" do
      long_email = String.duplicate("a", 243) <> "@example.com"
      changeset = ContactForm.changeset(%ContactForm{}, %{@valid_attrs | email: long_email})

      refute changeset.valid?
      assert "should be at most 254 character(s)" in errors_on(changeset).email
    end

    test "rejects subject longer than 200 characters" do
      long_subject = String.duplicate("a", 201)
      changeset = ContactForm.changeset(%ContactForm{}, %{@valid_attrs | subject: long_subject})

      refute changeset.valid?
      assert "should be at most 200 character(s)" in errors_on(changeset).subject
    end

    test "rejects message longer than 5000 characters" do
      long_message = String.duplicate("a", 5001)
      changeset = ContactForm.changeset(%ContactForm{}, %{@valid_attrs | message: long_message})

      refute changeset.valid?
      assert "should be at most 5000 character(s)" in errors_on(changeset).message
    end
  end
end
