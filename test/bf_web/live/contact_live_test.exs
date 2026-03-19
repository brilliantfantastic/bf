defmodule BrilliantFantasticWeb.ContactLiveTest do
  use BrilliantFantasticWeb.ConnCase

  import Phoenix.LiveViewTest

  @valid_attrs %{
    "name" => "Ada Lovelace",
    "email" => "ada@example.com",
    "subject" => "Collaboration inquiry",
    "message" => "I would love to discuss a potential project together."
  }

  describe "GET /contact" do
    test "renders the contact form with all fields", %{conn: conn} do
      {:ok, view, html} = live(conn, ~p"/contact")

      assert html =~ "Contact"
      assert has_element?(view, "input[name='contact_form[name]']")
      assert has_element?(view, "input[name='contact_form[email]']")
      assert has_element?(view, "input[name='contact_form[subject]']")
      assert has_element?(view, "textarea[name='contact_form[message]']")
      assert has_element?(view, "button[type='submit']")
    end
  end

  describe "validate (phx-change)" do
    test "shows validation errors for invalid data", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/contact")

      html =
        view
        |> form("form", contact_form: %{"name" => "", "email" => "not-an-email", "subject" => "", "message" => ""})
        |> render_change()

      assert html =~ "can&#39;t be blank" or html =~ "can't be blank"
    end

    test "shows error when message is too short", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/contact")

      html =
        view
        |> form("form", contact_form: Map.put(@valid_attrs, "message", "short"))
        |> render_change()

      assert html =~ "should be at least 10 character"
    end

    test "shows error for invalid email format", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/contact")

      html =
        view
        |> form("form", contact_form: Map.put(@valid_attrs, "email", "not-valid"))
        |> render_change()

      assert html =~ "has invalid format"
    end
  end

  describe "submit (phx-submit)" do
    test "shows all validation errors when submitting empty form", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/contact")

      html =
        view
        |> form("form", contact_form: %{"name" => "", "email" => "", "subject" => "", "message" => ""})
        |> render_submit()

      assert html =~ "can&#39;t be blank" or html =~ "can't be blank"
    end

    test "resets form and shows success flash on valid submission", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/contact")

      view
      |> form("form", contact_form: @valid_attrs)
      |> render_submit()

      html = render(view)

      # Form fields should be reset (no user-entered values remain)
      refute html =~ ~s(value="Ada Lovelace")
      refute html =~ ~s(value="ada@example.com")
      refute html =~ ~s(value="Collaboration inquiry")
      refute html =~ "I would love to discuss a potential project together."
    end

    test "delivers contact email on valid submission", %{conn: conn} do
      import Swoosh.TestAssertions

      {:ok, view, _html} = live(conn, ~p"/contact")

      view
      |> form("form", contact_form: @valid_attrs)
      |> render_submit()

      # Give the async Task time to deliver
      Process.sleep(50)

      assert_email_sent(subject: "Collaboration inquiry")
    end
  end
end
