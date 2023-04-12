defmodule SimpleTodo.TodoFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SimpleTodo.Todo` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        description: "some description",
        done: true,
        position: 42,
        title: "some title"
      })
      |> SimpleTodo.Todo.create_task()

    task
  end
end
