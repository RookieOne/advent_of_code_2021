defmodule AdventOfCode2021.Day1.Part2Test do
  use ExUnit.Case

  import AdventOfCode2021.Day1.Part2
  import AdventOfCode2021.Day1.ReadInput

  test "example should return answer" do
    {:ok, input} = read_file("test/day1/example.txt")

    answer = measure_depth(input)

    assert answer == 5
  end

  test "should return answer" do
    {:ok, input} = read_file("test/day1/input.txt")

    answer = measure_depth(input)

    assert answer == 1822
  end
end
