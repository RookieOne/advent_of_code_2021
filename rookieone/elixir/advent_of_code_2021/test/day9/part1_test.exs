defmodule AdventOfCode2021.Day9.Part1Test do
  use ExUnit.Case

  import AdventOfCode2021.Day9.Part1
  import AdventOfCode2021.Day9.ReadInput

  test "example should return answer" do
    {:ok, input} = read_file("test/day9/example.txt")

    {:ok, answer} = solve(input)

    assert answer == 15
  end

  test "input should return answer" do
    {:ok, input} = read_file("test/day9/input.txt")

    {:ok, answer} = solve(input)

    assert answer == 508
  end
end
