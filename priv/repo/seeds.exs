alias RemoteBackendExercise.Repo
alias RemoteBackendExercise.Users.User

now = DateTime.utc_now()

%{points: 0, inserted_at: now, updated_at: now}
|> List.duplicate(1_000_000)
|> Enum.chunk_every(Integer.floor_div(65_535, 3))
|> Enum.each(fn rows ->
  Repo.insert_all(User, rows)
end)
