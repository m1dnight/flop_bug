defmodule FlopTest.Pets do
  import Ecto.Query, warn: false

  alias Ecto.Changeset
  alias FlopTest.{Pet, Repo}

  @spec list_pets(map) ::
          {:ok, {[Pet.t()], Flop.Meta.t()}} | {:error, Flop.Meta.t()}
  def list_pets(params \\ %{}) do
    Flop.validate_and_run(Pet, params, for: Pet)
  end
end
