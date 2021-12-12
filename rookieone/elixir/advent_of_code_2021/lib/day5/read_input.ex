defmodule AdventOfCode2021.Day5.ReadInput do
  @moduledoc """
  Read file for Day 5 of Advent of Code

  0,9 -> 5,9
  """

  def read_file(path) do
    case File.read(path) do
      {:ok, contents} ->
        contents_by_line = String.split(contents, "\n")

        line_coords =
          for line_as_string <- contents_by_line, line_as_string != "" do
            [start_point_as_string, end_point_as_string] = String.split(line_as_string, " -> ")

            start_point = get_point_from_string(start_point_as_string)
            end_point = get_point_from_string(end_point_as_string)

            %{
              start_point: start_point,
              end_point: end_point
            }
          end

        {:ok, line_coords}
    end
  end

  def get_point_from_string(point_as_string) do
    [x_as_string, y_as_string] = String.split(point_as_string, ",")

    x = parse_string_as_int(x_as_string)
    y = parse_string_as_int(y_as_string)
    {x, y}
  end

  def parse_string_as_int(number_as_string) do
    case Integer.parse(number_as_string) do
      {number, _} -> number
      _ -> nil
    end
  end
end
