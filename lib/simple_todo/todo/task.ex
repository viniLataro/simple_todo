defmodule SimpleTodo.Todo.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :description, :string
    field :done, :boolean, default: false
    field :position, :integer
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :description, :position, :done])
    |> validate_required([:title, :description, :position, :done])
  end
end
