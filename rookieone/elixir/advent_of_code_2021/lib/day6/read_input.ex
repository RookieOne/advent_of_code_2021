defmodule AdventOfCode2021.Day6.ReadInput do
  @moduledoc """
  Read file for Day 6 of Advent of Code

  3,4,3,1,2
  """

  def read_file(path) do
    case File.read(path) do
      {:ok, contents} ->
        fish_timers =
          contents
          |> String.split("\n")
          |> hd()
          |> String.split(",")
          |> Enum.map(&parse_string_as_int/1)

        {:ok, fish_timers}
    end
  end

  def parse_string_as_int(number_as_string) do
    case Integer.parse(number_as_string) do
      {number, _} -> number
      _ -> nil
    end
  end
end
