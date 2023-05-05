alias Ecto.Changeset
alias FlopTest.{Pet, Repo}

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
