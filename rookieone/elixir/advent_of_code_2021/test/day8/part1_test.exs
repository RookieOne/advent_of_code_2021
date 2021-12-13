defmodule AdventOfCode2021.Day8.Part1Test do
  use ExUnit.Case

  import AdventOfCode2021.Day8.Part1
  import AdventOfCode2021.Day8.ReadInput

  test "example 1 should return answer" do
    {:ok, input} = read_file("test/day8/example1.txt")

    {:ok, answer} = solve(input)

    assert answer == 3
  end

  test "larger example should return answer" do
    {:ok, input} = read_file("test/day8/larger_example.txt")

    {:ok, answer} = solve(input)

    assert answer == 26
  end

  test "input should return answer" do
    {:ok, input} = read_file("test/day8/input.txt")

    {:ok, answer} = solve(input)

    assert answer == 532
  end
end
