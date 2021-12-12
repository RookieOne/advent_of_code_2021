defmodule AdventOfCode2021.Day5.Part2Test do
  use ExUnit.Case

  import AdventOfCode2021.Day5.Part2
  import AdventOfCode2021.Day5.ReadInput

  test "example should return answer" do
    {:ok, input} = read_file("test/day5/example.txt")

    {:ok, answer} = solve(input)

    assert answer == 12
  end

  test "input should return answer" do
    {:ok, input} = read_file("test/day5/input.txt")

    {:ok, answer} = solve(input)

    assert answer == 24_164
  end
end
