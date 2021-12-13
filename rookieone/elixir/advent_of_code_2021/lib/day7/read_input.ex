defmodule AdventOfCode2021.Day7.ReadInput do
  @moduledoc """
  Read file for Day 7 of Advent of Code

  3,4,3,1,2
  """

  def read_file(path) do
    case File.read(path) do
      {:ok, contents} ->
        numbers =
          contents
          |> String.split("\n")
          |> hd()
          |> String.split(",")
          |> Enum.map(&parse_string_as_int/1)

        {:ok, numbers}
    end
  end

  def parse_string_as_int(number_as_string) do
    case Integer.parse(number_as_string) do
      {number, _} -> number
      _ -> nil
    end
  end
end
