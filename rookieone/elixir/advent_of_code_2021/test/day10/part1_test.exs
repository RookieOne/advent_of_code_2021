defmodule AdventOfCode2021.Day10.Part1Test do
  use ExUnit.Case

  import AdventOfCode2021.Day10.Part1
  import AdventOfCode2021.Day10.ReadInput

  test "example should return answer" do
    {:ok, chunks} = read_file("test/day10/example.txt")

    {:ok, answer} = solve(chunks)

    assert answer == 26_397
  end

  test "input should return answer" do
    {:ok, input} = read_file("test/day10/input.txt")

    {:ok, answer} = solve(input)

    assert answer == 168_417
  end
end
