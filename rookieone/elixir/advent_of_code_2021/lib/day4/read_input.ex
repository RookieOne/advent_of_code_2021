defmodule AdventOfCode2021.Day4.ReadInput do
  @moduledoc """
  Read file for Day 4 of Advent of Code
  """

  def read_file(path) do
    case File.read(path) do
      {:ok, contents} ->
        contents_by_line = String.split(contents, "\n")

        [numbers_as_string | rest_of_file] = contents_by_line

        numbers =
          numbers_as_string
          |> String.split(",")
          |> Enum.map(&parse_string_as_int/1)

        boards = read_boards(rest_of_file, [], [])

        # remove empty boards
        boards =
          Enum.reject(boards, fn
            [] -> true
            _ -> false
          end)

        result = %{
          numbers: numbers,
          boards: boards
        }

        {:ok, result}
    end
  end

  def parse_string_as_int(number_as_string) do
    case Integer.parse(number_as_string) do
      {number, _} -> number
      _ -> nil
    end
  end

  def read_boards([], current_board, boards) do
    [current_board | boards]
  end

  def read_boards(["" | input], current_board, boards) do
    read_boards(input, [], [current_board | boards])
  end

  def read_boards([row_as_string | input], current_board, boards) do
    row =
      row_as_string
      |> String.split(" ")
      |> Enum.reject(fn
        "" -> true
        _ -> false
      end)
      |> Enum.map(&parse_string_as_int/1)

    read_boards(input, [row | current_board], boards)
  end
end
