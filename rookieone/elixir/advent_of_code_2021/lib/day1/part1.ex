defmodule AdventOfCode2021.Day1.Part1 do
  @moduledoc """
  Documentation Day 1 Part 1 of Advent of Code
  """

  def measure_depth(input) do
    check_previous_depth(input, nil, 0)
  end

  def check_previous_depth([], _previous_depth, total_increases) do
    total_increases
  end

  def check_previous_depth([depth|depths], nil, total_increases) do
    check_previous_depth(depths, depth, total_increases)
  end

  def check_previous_depth([depth|depths], previous_depth, total_increases) when depth > previous_depth do
    check_previous_depth(depths, depth, total_increases + 1)
  end

  def check_previous_depth([depth|depths], previous_depth, total_increases) do
    check_previous_depth(depths, depth, total_increases)
  end
end
