defmodule AdventOfCode2021.Day11.Part1 do
  @moduledoc """
  Documentation Day 11 Part 1 of Advent of Code
  """

  def solve(grid, steps: steps) do
    {final_grid, number_of_flashes} =
      1..steps
      |> Enum.to_list()
      |> Enum.reduce({grid, 0}, fn _step, {grid, number_of_flashes} ->
        {updated_grid, number_of_new_flashes} =
          grid
          |> add_one_energy_level()
          |> execute_flashes()
          |> zero_out_flashes()
          |> count_flashes()

        {updated_grid, number_of_flashes + number_of_new_flashes}
      end)

    {:ok, final_grid, number_of_flashes}
  end

  def add_one_energy_level(grid) do
    for row <- grid do
      for col <- row do
        col + 1
      end
    end
  end

  def execute_flashes(grid) do
    flashes = %{}

    execute_flashes(grid, flashes, is_done?(grid, flashes))
  end

  def execute_flashes(grid, flashes, _done = true) do
    {grid, flashes}
  end

  def execute_flashes(grid, flashes, _done = false) do
    new_flashes = get_new_flashes(grid, flashes)

    updated_grid =
      for {row, i} <- Enum.with_index(grid) do
        for {col, j} <- Enum.with_index(row) do
          col + adjacent_flashes({i, j}, new_flashes)
        end
      end

    updated_flashes = Map.merge(flashes, new_flashes)
    execute_flashes(updated_grid, updated_flashes, is_done?(updated_grid, updated_flashes))
  end

  def is_done?(grid, flashes) do
    not_done =
      for {row, i} <- Enum.with_index(grid) do
        for {col, j} <- Enum.with_index(row) do
          if col > 9 and !Map.has_key?(flashes, {i, j}) do
            false
          else
            true
          end
        end
      end
      |> Enum.flat_map(& &1)
      |> Enum.any?(&(&1 == false))

    !not_done
  end

  def get_new_flashes(grid, flashes) do
    for {row, i} <- Enum.with_index(grid),
        {col, j} <- Enum.with_index(row),
        col > 9,
        !Map.has_key?(flashes, {i, j}),
        into: %{} do
      {{i, j}, nil}
    end
  end

  def adjacent_flashes({i, j}, new_flashes) do
    [
      Map.has_key?(new_flashes, {i - 1, j - 1}),
      Map.has_key?(new_flashes, {i - 1, j}),
      Map.has_key?(new_flashes, {i - 1, j + 1}),
      Map.has_key?(new_flashes, {i, j - 1}),
      Map.has_key?(new_flashes, {i, j + 1}),
      Map.has_key?(new_flashes, {i + 1, j - 1}),
      Map.has_key?(new_flashes, {i + 1, j}),
      Map.has_key?(new_flashes, {i + 1, j + 1})
    ]
    |> Enum.filter(& &1)
    |> length()
  end

  def zero_out_flashes({grid, flashes}) do
    updated_grid =
      for {row, i} <- Enum.with_index(grid) do
        for {col, j} <- Enum.with_index(row) do
          if col > 9 do
            0
          else
            col
          end
        end
      end

    {updated_grid, flashes}
  end

  def count_flashes({grid, flashes}) do
    number_of_flashes = flashes |> Map.keys() |> length
    {grid, number_of_flashes}
  end
end
