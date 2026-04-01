defmodule BrilliantFantastic.ContactForm do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false

  embedded_schema do
    field :name, :string
    field :email, :string
    field :subject, :string
    field :message, :string
  end

  def changeset(contact_form \\ %__MODULE__{}, attrs) do
    contact_form
    |> cast(attrs, [:name, :email, :subject, :message])
    |> validate_required([:name, :email, :message])
    |> validate_length(:name, max: 200)
    |> validate_length(:email, max: 254)
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+\.[^\s]+$/)
    |> validate_length(:subject, max: 200)
    |> validate_length(:message, min: 10, max: 5_000)
  end
end
