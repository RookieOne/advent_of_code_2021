defmodule AdventOfCode2021.Day5.Part1 do
  @moduledoc """
  Documentation Day 5 Part 1 of Advent of Code
  """

  def solve(lines) do
    grid = create_grid(lines)

    grid =
      for line <- lines, reduce: grid do
        grid ->
          direction = get_direction(line)
          add_line_to_grid(grid, line, direction)
      end

    total_dangerous_points =
      for {_, count} <- grid, count >= 2, reduce: 0 do
        total -> total + 1
      end

    {:ok, total_dangerous_points}
  end

  def create_grid(lines) do
    points =
      lines
      |> Enum.map(&[&1.start_point, &1.end_point])
      |> List.flatten()

    max_x =
      points
      |> Enum.map(& &1.x)
      |> Enum.sort()
      |> Enum.reverse()
      |> hd()

    max_y =
      points
      |> Enum.map(& &1.y)
      |> Enum.sort()
      |> Enum.reverse()
      |> hd()

    for x <- 0..max_x, y <- 0..max_y, into: %{} do
      {{x, y}, 0}
    end
  end

  def get_direction(%{start_point: %{x: x}, end_point: %{x: x}}) do
    :vertical
  end

  def get_direction(%{start_point: %{y: y}, end_point: %{y: y}}) do
    :horizontal
  end

  def get_direction(_line) do
    :diagonal
  end

  def add_line_to_grid(grid, line, :horizontal) do
    y = line.start_point.y
    [min_x, max_x] = Enum.sort([line.start_point.x, line.end_point.x])

    for x <- min_x..max_x, reduce: grid do
      grid ->
        Map.put(grid, {x, y}, grid[{x, y}] + 1)
    end
  end

  def add_line_to_grid(grid, line, :vertical) do
    x = line.start_point.x
    [min_y, max_y] = Enum.sort([line.start_point.y, line.end_point.y])

    for y <- min_y..max_y, reduce: grid do
      grid ->
        Map.put(grid, {x, y}, grid[{x, y}] + 1)
    end
  end

  def add_line_to_grid(grid, _line, :diagonal) do
    grid
  end
end
