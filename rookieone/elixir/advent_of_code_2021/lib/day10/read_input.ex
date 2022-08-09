defmodule AdventOfCode2021.Day10.ReadInput do
  @moduledoc """
  Read file for Day 10 of Advent of Code

  [({(<(())[]>[[{[]{<()<>>
  [(()[<>])]({[<{<<[]>>(
  {([(<{}[<>[]}>{[]{[(<()>
  (((({<>}<{<{<>}{[]{[]{}
  [[<[([]))<([[{}[[()]]]
  [{[{({}]{}}([{[{{{}}([]
  {<[[]]>}<{[{[{[]{()[[[]
  [<(<(<(<{}))><([]([]()
  <{([([[(<>()){}]>(<<{{
  <{([{{}}[<[[[<>{}]]]>[]]
  """

  def read_file(path) do
    case File.read(path) do
      {:ok, contents} ->
        lines =
          for line <- String.split(contents, "\n") do
            line
            |> String.graphemes()
          end
          |> Enum.reject(&(&1 == []))

        {:ok, lines}
    end
  end
end
