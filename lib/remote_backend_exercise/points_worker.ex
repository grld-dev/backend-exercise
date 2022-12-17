defmodule RemoteBackendExercise.PointsWorker do
  use GenServer

  import Ecto.Query

  alias RemoteBackendExercise.Repo
  alias RemoteBackendExercise.Users.User

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def init(_opts) do
    send(self(), :work)

    {:ok,
     %{
       min_number: random_integer(),
       timestamp: nil
     }}
  end

  def handle_call(:query, _from, %{min_number: min_number, timestamp: prev_timestamp} = state) do
    users = Repo.all(from(u in User, where: u.points > ^min_number, limit: 2))

    {:reply, {users, prev_timestamp}, %{state | timestamp: DateTime.utc_now()}}
  end

  def handle_info(:work, state) do
    Repo.update_all(
      from(u in User, update: [set: [points: fragment("floor(random() * 101)")]]),
      []
    )

    schedule_work()

    {:noreply, %{state | min_number: random_integer()}}
  end

  defp random_integer, do: :rand.uniform(101) - 1

  defp schedule_work, do: Process.send_after(self(), :work, 60 * 1000)
end
