defmodule AdventOfCode2021.Day9.Part2Test do
  use ExUnit.Case

  import AdventOfCode2021.Day9.Part2
  import AdventOfCode2021.Day9.ReadInput

  test "example should return answer" do
    {:ok, input} = read_file("test/day9/example.txt")

    {:ok, answer} = solve(input)

    assert answer == 1_134
  end

  test "input should return answer" do
    {:ok, input} = read_file("test/day9/input.txt")

    {:ok, answer} = solve(input)

    assert answer == 1_564_640
  end
end
