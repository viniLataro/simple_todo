defmodule SimpleTodo.Repo do
  use Ecto.Repo,
    otp_app: :simple_todo,
    adapter: Ecto.Adapters.Postgres
end
