defmodule RemoteBackendExercise.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:points, :integer, default: 0)

    timestamps(type: :utc_datetime_usec)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:points])
    |> validate_required([])
  end
end
