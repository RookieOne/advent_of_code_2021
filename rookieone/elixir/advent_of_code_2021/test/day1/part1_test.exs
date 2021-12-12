defmodule AdventOfCode2021.Day1.Part1Test do
  use ExUnit.Case

  import AdventOfCode2021.Day1.Part1
  import AdventOfCode2021.Day1.ReadInput

  test "example should return answer" do
    {:ok, input} = read_file("test/day1/example.txt")

    answer = measure_depth(input)

    assert answer == 7
  end

  test "input should return answer" do
    {:ok, input} = read_file("test/day1/input.txt")

    answer = measure_depth(input)

    assert answer == 1791
  end
end
