defmodule AdventOfCode2021.Day9.Part1 do
  @moduledoc """
  Documentation Day 9 Part 1 of Advent of Code
  """

  def solve(input) do
    map =
      for {line, r} <- Enum.with_index(input), {number, c} <- Enum.with_index(line), into: %{} do
        {{r, c}, number}
      end

    low_points =
      for {{r, c}, number} <- map, reduce: [] do
        acc ->
          surrounding_points =
            [
              map[{r, c - 1}],
              map[{r, c + 1}],
              map[{r - 1, c}],
              map[{r + 1, c}]
            ]
            |> Enum.filter(& &1)

          low? = Enum.all?(surrounding_points, &(&1 > number))

          if low? do
            [number | acc]
          else
            acc
          end
      end

    risk_level = for point <- low_points, reduce: 0 do
      sum -> sum = sum + point + 1
    end

    {:ok, risk_level}
  end
end
