defmodule AdventOfCode2021.Day10.Part2Test do
  use ExUnit.Case

  import AdventOfCode2021.Day10.Part2
  import AdventOfCode2021.Day10.ReadInput

  test "example should return answer" do
    {:ok, chunks} = read_file("test/day10/example.txt")

    {:ok, answer} = solve(chunks)

    assert answer == 288_957
  end

  test "input should return answer" do
    {:ok, input} = read_file("test/day10/input.txt")

    {:ok, answer} = solve(input)

    assert answer == 2_802_519_786
  end
end
