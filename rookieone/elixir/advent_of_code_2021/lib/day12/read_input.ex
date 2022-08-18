defmodule AdventOfCode2021.Day12.ReadInput do
  @moduledoc """
  Read file for Day 12 of Advent of Code

  start-A
  start-b
  A-c
  A-b
  b-d
  A-end
  b-end
  """

  def read_file(path) do
    case File.read(path) do
      {:ok, contents} ->
        input =
          for line <- String.split(contents, "\n") do
            String.split(line, "-")
          end
          |> Enum.reject(&(&1 == []))

        {:ok, input}
    end
  end
end
