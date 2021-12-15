defmodule AdventOfCode2021.Day9.ReadInput do
  @moduledoc """
  Read file for Day 9 of Advent of Code

  2199943210
  """

  def read_file(path) do
    case File.read(path) do
      {:ok, contents} ->
        lines =
          for line <- String.split(contents, "\n") do
            line
            |> String.graphemes()
            |> Enum.map(&parse_string_as_int/1)
          end
          |> Enum.reject(&(&1 == []))

        {:ok, lines}
    end
  end

  def parse_string_as_int(number_as_string) do
    case Integer.parse(number_as_string) do
      {number, _} -> number
      _ -> nil
    end
  end
end
