defmodule RemoteBackendExerciseWeb.RootController do
  use RemoteBackendExerciseWeb, :controller

  def index(conn, _params) do
    {users, timestamp} = GenServer.call(RemoteBackendExercise.PointsWorker, :query)

    render(conn, "index.json", timestamp: timestamp, users: users)
  end
end
