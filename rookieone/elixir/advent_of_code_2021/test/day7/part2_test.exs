defmodule AdventOfCode2021.Day7.Part2Test do
  use ExUnit.Case

  import AdventOfCode2021.Day7.Part2
  import AdventOfCode2021.Day7.ReadInput

  test "example should return answer" do
    {:ok, input} = read_file("test/day7/example.txt")

    {:ok, answer} = solve(input)

    assert answer == 168
  end

  test "input should return answer" do
    {:ok, input} = read_file("test/day7/input.txt")

    {:ok, answer} = solve(input)

    assert answer == 96_086_265
  end
end
