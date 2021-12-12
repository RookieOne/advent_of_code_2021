defmodule AdventOfCode2021.Day6.Part2Test do
  use ExUnit.Case

  import AdventOfCode2021.Day6.Part2
  import AdventOfCode2021.Day6.ReadInput

  test "example should return answer" do
    {:ok, input} = read_file("test/day6/example.txt")

    {:ok, answer} = solve(input)

    assert answer == 26_984_457_539
  end

  test "input should return answer" do
    {:ok, input} = read_file("test/day6/input.txt")

    {:ok, answer} = solve(input)

    assert answer == 1_609_058_859_115
  end
end
