defmodule AdventOfCode2021.Day4.Part1Test do
  use ExUnit.Case

  import AdventOfCode2021.Day5.Part1
  import AdventOfCode2021.Day5.ReadInput

  test "example should return answer" do
    {:ok, input} = read_file("test/day5/example.txt")

    {:ok, answer} = solve(input)

    assert answer.score == 4_512
  end

  # test "input should return answer" do
  #   {:ok, input} = read_file("test/day4/input.txt")

  #   {:ok, answer} = solve(input)

  #   assert answer.score == 11_536
  # end
end
