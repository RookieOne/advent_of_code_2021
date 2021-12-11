require "./code/day1/part1"
require "./code/day1/file_reader"

RSpec.describe "Day 1 Part1 1" do
  it "example should be 7" do
    input = Day1FileReader.read_file("./spec/day1/example.txt")

    answer = Day1Part1.solve(input)

    expect(answer).to   eq(7)
  end

  it "input should solve the problem" do
    input = Day1FileReader.read_file("./spec/day1/input.txt")

    answer = Day1Part1.solve(input)

    expect(answer).to   eq(1791)
  end
end
