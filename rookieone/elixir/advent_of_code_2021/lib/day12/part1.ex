defmodule AdventOfCode2021.Day12.Part1 do
  @moduledoc """
  Documentation Day 12 Part 1 of Advent of Code
  """

  def solve(input) do
    map = create_map(input)
    IO.inspect(map)

    valid_paths = find_valid_paths(map)

    {:ok, valid_paths}
  end

  def create_map(input) do
    Enum.reduce(input, %{}, fn [p1, p2], map ->
      p1_list = map[p1] || []
      p2_list = map[p2] || []

      map
      |> Map.put(p1, [p2 | p1_list])
      |> Map.put(p2, [p1 | p2_list])
    end)
  end

  def find_valid_paths(map) do
    go_next("start", map, [])
  end

  def go_next("end", _map, current_path, valid_paths) do
    [["end" | current_path] | valid_paths]
  end

  def go_next(point, map, current_path, valid_paths) do
    next_points = map[point]
  end
end
