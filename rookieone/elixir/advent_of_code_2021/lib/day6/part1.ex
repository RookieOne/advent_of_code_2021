defmodule AdventOfCode2021.Day6.Part1 do
  @moduledoc """
  Documentation Day 6 Part 1 of Advent of Code
  """

  def solve(starting_fish_timers) do
    empty_state =
      for timer <- 0..8, into: %{} do
        {timer, 0}
      end

    initial_state =
      for timer <- starting_fish_timers, reduce: empty_state do
        state ->
          Map.put(state, timer, state[timer] + 1)
      end

    final_state = process(80, initial_state, 8, %{})

    total_fish = final_state |> Map.values() |> Enum.sum()

    {:ok, total_fish}
  end

  def process(1, _initial_state, -1, final_state) do
    final_state
  end

  def process(day_number, _initial_state, -1, final_state) do
    process(day_number - 1, final_state, 8, %{})
  end

  def process(day_number, initial_state, 0, final_state) do
    current_fish_count = initial_state[0]

    final_state =
      final_state
      |> Map.put(8, current_fish_count)
      |> Map.put(6, final_state[6] + current_fish_count)

    process(day_number, initial_state, -1, final_state)
  end

  def process(day_number, initial_state, timer_value, final_state) do
    current_fish_count = initial_state[timer_value]

    final_state = Map.put(final_state, timer_value - 1, current_fish_count)

    process(day_number, initial_state, timer_value - 1, final_state)
  end
end
