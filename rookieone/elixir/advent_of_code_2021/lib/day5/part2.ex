defmodule AdventOfCode2021.Day5.Part2 do
  @moduledoc """
  Documentation Day 5 Part 2 of Advent of Code
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

  def add_line_to_grid(grid, line, :diagonal) do
    line_length = abs(line.start_point.x - line.end_point.x)

    x_direction =
      if line.start_point.x > line.end_point.x do
        -1
      else
        1
      end

    y_direction =
      if line.start_point.y > line.end_point.y do
        -1
      else
        1
      end

    start_x = line.start_point.x
    start_y = line.start_point.y

    {_, _, grid} =
      for _ <- 0..line_length, reduce: {start_x, start_y, grid} do
        {x, y, grid} ->
          {x + x_direction, y + y_direction, Map.put(grid, {x, y}, grid[{x, y}] + 1)}
      end

    grid
  end

  def debug(grid, x, y) do
    IO.inspect("[#{x}, #{y}] : #{grid[{x, y}]}")
  end
end
