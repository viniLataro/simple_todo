defmodule SimpleTodo.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string
      add :description, :string
      add :position, :integer
      add :done, :boolean, default: false, null: false

      timestamps()
    end
  end
end
