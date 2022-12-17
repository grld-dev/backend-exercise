defmodule RemoteBackendExerciseWeb.RootView do
  use RemoteBackendExerciseWeb, :view

  def render("index.json", %{timestamp: timestamp, users: users}),
    do: %{
      timestamp: timestamp,
      users: Enum.map(users, &%{id: &1.id, points: &1.points})
    }
end
