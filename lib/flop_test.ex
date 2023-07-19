defmodule FlopTest do
  import Ecto.Query
  @moduledoc """
  Documentation for `FlopTest`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> FlopTest.hello()
      :world

  """
  def query_example do
    q = from(p in FlopTest.Pet, where: p.is_good == type(^true, :boolean))

    IO.inspect FlopTest.Repo.to_sql(:all, q)
    FlopTest.Repo.all(q)

  end
  def add_pets do
    [
      {"CatMcCatface", 10, "Cattius McCattiusFacus", true},
      {"DogMcDogface", 20, "Doggus McDoggusFacus", true},
      {"Whiskers", 4, "Siamese", true},
      {"Max", 2, "Golden Retriever", true},
      {"Luna", 6, "Maine Coon", true},
      {"Buddy", 3, "Labrador Retriever", true},
      {"Mittens", 8, "Persian", true},
      {"Rocky", 5, "German Shepherd", true},
      {"Oliver", 1, "Bengal", true},
      {"Bailey", 7, "Boxer", true},
      {"Smokey", 9, "British Shorthair", true},
      {"Charlie", 4, "Poodle", true}
    ]
    |> Enum.map(fn {name, age, species, is_good} ->
      %FlopTest.Pet{name: name, age: age, species: species, is_good: is_good}
      |> Ecto.Changeset.change()
      |> FlopTest.Repo.insert()
    end)
  end
end
