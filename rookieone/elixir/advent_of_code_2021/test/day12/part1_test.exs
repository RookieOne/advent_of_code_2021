defmodule AdventOfCode2021.Day12.Part1Test do
  use ExUnit.Case

  import AdventOfCode2021.Day12.Part1
  import AdventOfCode2021.Day12.ReadInput

  test "example should return answer" do
    {:ok, input} = read_file("test/day12/example.txt")

    {:ok, answer} = solve(input)

    assert answer == nil
  end

  # test "input should return answer" do
  #   {:ok, grid} = read_file("test/day11/input.txt")

  #   {:ok, _grid, number_of_flashes} = solve(grid, steps: 100)

  #   assert number_of_flashes == 1_739
  # end
end
