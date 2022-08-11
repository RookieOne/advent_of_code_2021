defmodule AdventOfCode2021.Day11.Part2Test do
  use ExUnit.Case

  import AdventOfCode2021.Day11.Part2
  import AdventOfCode2021.Day11.ReadInput

  test "example should return answer" do
    {:ok, grid} = read_file("test/day11/example.txt")

    {:ok, step} = solve(grid)

    assert step == 195
  end

  test "input should return answer" do
    {:ok, grid} = read_file("test/day11/input.txt")

    {:ok, step} = solve(grid)

    assert step == 324
  end
end
