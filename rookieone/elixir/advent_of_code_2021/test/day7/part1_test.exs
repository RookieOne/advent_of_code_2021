defmodule AdventOfCode2021.Day7.Part1Test do
  use ExUnit.Case

  import AdventOfCode2021.Day7.Part1
  import AdventOfCode2021.Day7.ReadInput

  test "example should return answer" do
    {:ok, input} = read_file("test/day7/example.txt")

    {:ok, answer} = solve(input)

    assert answer == 37
  end

  test "input should return answer" do
    {:ok, input} = read_file("test/day7/input.txt")

    {:ok, answer} = solve(input)

    assert answer == 343_468
  end
end
