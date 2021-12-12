defmodule AdventOfCode2021.Day4.Part2Test do
  use ExUnit.Case

  import AdventOfCode2021.Day4.Part2
  import AdventOfCode2021.Day4.ReadInput

  test "example should return answer" do
    {:ok, input} = read_file("test/day4/example.txt")

    {:ok, answer} = solve(input)

    assert answer.score == 1_924
  end

  test "input should return answer" do
    {:ok, input} = read_file("test/day4/input.txt")

    {:ok, answer} = solve(input)

    assert answer.score == 1_284
  end
end
