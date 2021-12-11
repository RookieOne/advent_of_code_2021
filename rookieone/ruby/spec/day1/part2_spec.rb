require "./code/day1/part2"
require "./code/day1/file_reader"

RSpec.describe "Day 1 Part 2" do
  it "example should be 7" do
    input = Day1FileReader.read_file("./spec/day1/example.txt")

    answer = Day1Part2.new(input).solve()

    expect(answer).to   eq(5)
  end

  it "input should solve the problem" do
    input = Day1FileReader.read_file("./spec/day1/input.txt")

    answer = Day1Part2.new(input).solve()

    expect(answer).to   eq(1822)
  end
end
