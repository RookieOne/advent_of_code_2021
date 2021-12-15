defmodule AdventOfCode2021.Day9.Part2 do
  @moduledoc """
  Documentation Day 9 Part 2 of Advent of Code
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
            [{r, c} | acc]
          else
            acc
          end
      end

    map_without_high_points =
      for {{r, c}, number} <- map, into: %{} do
        if number == 9 do
          {{r, c}, nil}
        else
          {{r, c}, number}
        end
      end

    basins = map_basins(map_without_high_points, low_points, [])

    # three_largest_basin_sizes
    [size1, size2, size3] =
      basins
      |> Enum.map(&length/1)
      |> Enum.sort()
      |> Enum.reverse()
      |> Enum.take(3)

    result = size1 * size2 * size3

    {:ok, result}
  end

  def map_basins(_map, [], basins) do
    basins
  end

  def map_basins(map, [low_point | low_points], basins) do
    {map, basin} = map_basin({map, []}, low_point)

    map_basins(map, low_points, [basin | basins])
  end

  def map_basin({map, basin_points}, point = {r, c}) do
    case map[point] do
      nil ->
        updated_map = Map.put(map, point, nil)
        {updated_map, basin_points}

      _number ->
        updated_map = Map.put(map, point, nil)
        updated_basin_points = [point | basin_points]

        {updated_map, updated_basin_points}
        |> map_basin({r, c + 1})
        |> map_basin({r, c - 1})
        |> map_basin({r + 1, c})
        |> map_basin({r - 1, c})
    end
  end
end
