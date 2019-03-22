defmodule Discuss.User do
  use Discuss.Web, :model

  # Schema
  schema "users" do
    field :email, :string
    field :provider, :string
    field :token, :string
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:token, :email, :provider])
    |> validate_required([:email, :provider, :token])
  end

end
