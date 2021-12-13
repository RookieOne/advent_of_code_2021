defmodule AdventOfCode2021.Day7.Part1 do
  @moduledoc """
  Documentation Day 7 Part 1 of Advent of Code
  """

  def solve(horizontal_positions) do
    min_position = Enum.min(horizontal_positions)
    max_position = Enum.max(horizontal_positions)

    fuel_chart =
      for target_position <- min_position..max_position, into: %{} do
        fuel_spent =
          for position <- horizontal_positions do
            abs(position - target_position)
          end
          |> Enum.sum()

        {fuel_spent, target_position}
      end

    min_fuel_spent = fuel_chart |> Map.keys() |> Enum.min()

    {:ok, min_fuel_spent}
  end
end
