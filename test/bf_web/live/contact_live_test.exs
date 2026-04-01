defmodule BrilliantFantasticWeb.HomeLive.ContactFormTest do
  use BrilliantFantasticWeb.ConnCase

  import Phoenix.LiveViewTest

  @valid_attrs %{
    "name" => "Ada Lovelace",
    "email" => "ada@example.com",
    "subject" => "Collaboration inquiry",
    "message" => "I would love to discuss a potential project together."
  }

  describe "contact form on homepage" do
    test "renders the contact form with all fields", %{conn: conn} do
      {:ok, view, html} = live(conn, ~p"/")

      assert html =~ "Let&#39;s connect" or html =~ "Let's connect"
      assert has_element?(view, "input[name='contact_form[name]']")
      assert has_element?(view, "input[name='contact_form[email]']")
      assert has_element?(view, "input[name='contact_form[subject]']")
      assert has_element?(view, "textarea[name='contact_form[message]']")
      assert has_element?(view, "button[type='submit']")
    end
  end

  describe "validate (phx-change)" do
    test "shows validation errors for invalid data", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/")

      html =
        view
        |> form("form",
          contact_form: %{
            "name" => "",
            "email" => "not-an-email",
            "subject" => "",
            "message" => ""
          }
        )
        |> render_change()

      assert html =~ "can&#39;t be blank" or html =~ "can't be blank"
    end

    test "shows error when message is too short", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/")

      html =
        view
        |> form("form", contact_form: Map.put(@valid_attrs, "message", "short"))
        |> render_change()

      assert html =~ "should be at least 10 character"
    end

    test "shows error for invalid email format", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/")

      html =
        view
        |> form("form", contact_form: Map.put(@valid_attrs, "email", "not-valid"))
        |> render_change()

      assert html =~ "has invalid format"
    end
  end

  describe "submit (phx-submit)" do
    test "shows all validation errors when submitting empty form", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/")

      html =
        view
        |> form("form",
          contact_form: %{"name" => "", "email" => "", "subject" => "", "message" => ""}
        )
        |> render_submit()

      assert html =~ "can&#39;t be blank" or html =~ "can't be blank"
    end

    test "replaces form with thank-you message on valid submission", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/")

      view
      |> form("form", contact_form: @valid_attrs)
      |> render_submit()

      render(view)

      # Success state should be visible, form should not
      assert has_element?(view, "#contact-success")
      refute has_element?(view, "form")
    end

    test "delivers contact email on valid submission", %{conn: conn} do
      import Swoosh.TestAssertions

      {:ok, view, _html} = live(conn, ~p"/")

      view
      |> form("form", contact_form: @valid_attrs)
      |> render_submit()

      # Give the async Task time to deliver
      Process.sleep(50)

      assert_email_sent(subject: "Collaboration inquiry")
    end
  end
end
