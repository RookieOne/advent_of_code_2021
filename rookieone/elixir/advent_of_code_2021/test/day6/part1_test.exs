defmodule AdventOfCode2021.Day6.Part1Test do
  use ExUnit.Case

  import AdventOfCode2021.Day6.Part1
  import AdventOfCode2021.Day6.ReadInput

  test "example should return answer" do
    {:ok, input} = read_file("test/day6/example.txt")

    {:ok, answer} = solve(input)

    assert answer == 5_934
  end

  test "input should return answer" do
    {:ok, input} = read_file("test/day6/input.txt")

    {:ok, answer} = solve(input)

    assert answer == 354_564
  end
end
