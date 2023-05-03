defmodule FlopTestTest do
  use ExUnit.Case
  doctest FlopTest

  test "greets the world" do
    assert FlopTest.hello() == :world
  end
end
