defmodule AdventOfCode2021.Day1.Part2 do
  @moduledoc """
  Documentation Day 1 Part 2 of Advent of Code
  """

  def measure_depth(input) do
    result =
      for depth <- input, reduce: %{count: 0, depth_windows: [], current_depth_window: []} do
        acc -> depth_step(depth, acc.count, acc.depth_windows, acc.current_depth_window)
      end

    # handle last depth
    result = depth_step(nil, result.count, result.depth_windows, result.current_depth_window)

    result.count
  end

  def depth_step(
        depth,
        _count,
        _depth_windows = [],
        _current_depth_window = [depth3, depth2, depth1]
      ) do
    sum = depth1 + depth2 + depth3

    %{
      depth_windows: [sum],
      count: 0,
      current_depth_window: [depth, depth3, depth2]
    }
  end

  def depth_step(
        depth,
        count,
        depth_windows = [sum_from_last_depth_window | _tail],
        _current_depth_window = [depth3, depth2, depth1]
      ) do
    sum = depth1 + depth2 + depth3

    new_count =
      if sum_from_last_depth_window < sum do
        count + 1
      else
        count
      end

    %{
      depth_windows: [sum | depth_windows],
      count: new_count,
      current_depth_window: [depth, depth3, depth2]
    }
  end

  def depth_step(depth, _count, depth_windows = [], current_depth_window) do
    %{
      depth_windows: [],
      count: 0,
      current_depth_window: [depth | current_depth_window]
    }
  end
end
