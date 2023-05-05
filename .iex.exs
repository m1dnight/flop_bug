alias FlopTest.{Pet, Repo, Pets}
import Ecto.Query
require Ecto.Query

alias Ecto.Changeset
alias FlopTest.{Pet, Repo}

# Delete existing pets.
Repo.delete_all(Pet)

# Seed the pet database.
pets = [
  %FlopTest.Pet{
    name: "BunnyMcBunnyface",
    age: 1,
    species: "labrabunny"
  },
  %FlopTest.Pet{
    name: "CattyMcCatface",
    age: 1,
    species: "labracat"
  },
  %FlopTest.Pet{
    name: "DoggyMcDogface",
    age: 1,
    species: "labradoodle"
  }
]

for pet <- pets do
  pet
  |> FlopTest.Pet.changeset()
  |> FlopTest.Repo.insert()
end

# Get first page.
{:ok, {pets_page_1, meta_page_1}} =
  Flop.validate_and_run(Pet, %{}, for: Pet, default_pagination_type: :first)

IO.puts("Page 1: #{Enum.map(pets_page_1, fn pet -> pet.name end) |> Enum.join(", ")}")

# Delete the last item.
from(p in Pet, where: p.name == "DoggyMcDogface")
|> Repo.one!()
|> Repo.delete()

# Get the second page
# This will return an empty page.
flop_page_2 = Flop.to_next_cursor(meta_page_1)

{:ok, {pets_page_2, meta_page_2}} =
  Flop.validate_and_run(Pet, flop_page_2, for: Pet, default_pagination_type: :first)

IO.puts("Page 2: #{Enum.map(pets_page_2, fn pet -> pet.name end) |> Enum.join(", ")}")

# Go back to the first page.
# When you navigate back from the page it will fail if the page was empty.
flop_page_1 = Flop.to_previous_cursor(meta_page_2)

{:ok, {pets_page_1, meta_page_1}} =
  Flop.validate_and_run(Pet, flop_page_1, for: Pet, default_pagination_type: :first)

IO.puts("Page 1: #{Enum.map(pets_page_1, fn pet -> pet.name end) |> Enum.join(", ")}")
