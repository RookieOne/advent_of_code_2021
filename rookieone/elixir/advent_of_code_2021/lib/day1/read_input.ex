defmodule AdventOfCode2021.Day1.ReadInput do
  @moduledoc """
  Read file for Day 1 of Advent of Code
  """

  def read_file(path) do
    case File.read(path) do
      {:ok, contents} ->
        results = contents
        |> String.split("\n")
        |> Enum.reject(fn string -> 
          string == ""
        end)
        |> Enum.map(fn number_as_string ->
          {number, _} = Integer.parse(number_as_string)
          number
        end)

        {:ok, results}
    end
  end
end
