defmodule Discuss.User do
  use Discuss.Web, :model

  @derive { Poison.Encoder, only: [:email] }

  # Schema
  schema "users" do
    field :email, :string
    field :provider, :string
    field :token, :string
    has_many :topics, Discuss.Topic
    has_many :comments, Discuss.Comment
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:token, :email, :provider])
    |> validate_required([:email, :provider, :token])
  end

end
