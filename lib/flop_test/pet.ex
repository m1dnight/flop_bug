defmodule FlopTest.Pet do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {
    Flop.Schema,
    filterable: [:name, :species],
    sortable: [:name, :age],
    default_order: %{
      order_by: [:name],
      order_directions: [:asc]
    },
    pagination_types: [:first, :last, :offset, :page]
  }

  schema "pets" do
    field(:name, :string)
    field(:age, :integer)
    field(:species, :string)

    timestamps()
  end

  def changeset(pet, params \\ %{}) do
    pet
    |> cast(params, [:name, :age, :species])
    |> validate_required([:name, :age, :species])
  end
end
