defmodule FlopTest.Repo.Migrations.Pet do
  use Ecto.Migration

  def change do
    create table("pets") do
      add :name,    :string
      add :age,    :integer
      add :species,    :string

      timestamps()
    end
  end
end
