defmodule AdventOfCode2021.Day4.Part1Test do
  use ExUnit.Case

  import AdventOfCode2021.Day4.Part1
  import AdventOfCode2021.Day4.ReadInput

  test "example should return answer" do
    {:ok, input} = read_file("test/day4/example.txt")

    answer = solve(input)

    assert answer == 7
  end
end
