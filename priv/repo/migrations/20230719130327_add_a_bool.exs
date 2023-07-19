defmodule FlopTest.Repo.Migrations.AddABool do
  use Ecto.Migration

  def change do
    alter table(:pets) do
      add :is_good, :boolean, default: true
    end
  end
end
