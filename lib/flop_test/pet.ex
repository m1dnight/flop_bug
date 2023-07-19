defmodule FlopTest.Pet do
  use Ecto.Schema

  @derive {
    Flop.Schema,
    filterable: [:name, :species],
    sortable: [:name, :age],
    pagination_types: [:first, :last]
  }

  schema "pets" do
    field(:name, :string)
    field(:age, :integer)
    field(:species, :string)
  end
end
