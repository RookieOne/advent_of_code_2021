defmodule AdventOfCode2021.Day8.Part2Test do
  use ExUnit.Case

  import AdventOfCode2021.Day8.Part2
  import AdventOfCode2021.Day8.ReadInput

  test "small example should return answer" do
    {:ok, input} = read_file("test/day8/example.txt")

    {:ok, answer} = solve(input)

    assert answer == 5_353
  end

  test "example should return answer" do
    {:ok, input} = read_file("test/day8/example2.txt")

    {:ok, answer} = solve(input)

    assert answer == 5_282
  end

  test "input should return answer" do
    {:ok, input} = read_file("test/day8/input.txt")

    {:ok, answer} = solve(input)

    assert answer == 1_011_284
  end
end
