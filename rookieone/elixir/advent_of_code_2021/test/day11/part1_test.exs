defmodule AdventOfCode2021.Day11.Part1Test do
  use ExUnit.Case

  import AdventOfCode2021.Day11.Part1
  import AdventOfCode2021.Day11.ReadInput

  test "simple should return answer and grid after 1 step" do
    {:ok, grid} = read_file("test/day11/simple.txt")

    {:ok, grid, _number_of_flashes} = solve(grid, steps: 1)

    assert grid ==
             format_grid("""
             34543
             40004
             50005
             40004
             34543
             """)
  end

  test "simple should return answer and grid after 2 steps" do
    {:ok, grid} = read_file("test/day11/simple.txt")

    {:ok, grid, _number_of_flashes} = solve(grid, steps: 2)

    assert grid ==
             format_grid("""
             45654
             51115
             61116
             51115
             45654
             """)
  end

  test "example should return answer and grid after 1 step" do
    {:ok, grid} = read_file("test/day11/example.txt")

    {:ok, grid, number_of_flashes} = solve(grid, steps: 1)

    assert grid ==
             format_grid("""
             6594254334
             3856965822
             6375667284
             7252447257
             7468496589
             5278635756
             3287952832
             7993992245
             5957959665
             6394862637
             """)

    assert number_of_flashes == 0
  end

  test "example should return answer and grid after 2 steps" do
    {:ok, grid} = read_file("test/day11/example.txt")

    {:ok, grid, number_of_flashes} = solve(grid, steps: 2)

    assert grid ==
             format_grid("""
             8807476555
             5089087054
             8597889608
             8485769600
             8700908800
             6600088989
             6800005943
             0000007456
             9000000876
             8700006848
             """)

    assert number_of_flashes == 35
  end

  test "example should return answer and grid after 100 steps" do
    {:ok, grid} = read_file("test/day11/example.txt")

    {:ok, grid, number_of_flashes} = solve(grid, steps: 100)

    assert grid ==
             format_grid("""
             0397666866
             0749766918
             0053976933
             0004297822
             0004229892
             0053222877
             0532222966
             9322228966
             7922286866
             6789998766
             """)

    assert number_of_flashes == 1_656
  end

  test "input should return answer" do
    {:ok, grid} = read_file("test/day11/input.txt")

    {:ok, _grid, number_of_flashes} = solve(grid, steps: 100)

    assert number_of_flashes == 1_739
  end

  def format_grid(grid_as_string) do
    for row <- String.split(grid_as_string, "\n") do
      row
      |> String.graphemes()
      |> Enum.map(fn number_as_string ->
        case Integer.parse(number_as_string) do
          {number, _} -> number
          _ -> nil
        end
      end)
    end
    |> Enum.reject(&(&1 == []))
  end
end
