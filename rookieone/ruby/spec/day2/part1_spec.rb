require "./code/day2/part1"
require "./code/day2/file_reader"

RSpec.describe "Day 2 Part 1" do
  it "example should be 150" do
    input = Day2FileReader.read_file("./spec/day2/example.txt")

    answer = Day2Part1.solve(input)

    expect(answer).to   eq(150)
  end

  it "input should return answer" do
    input = Day2FileReader.read_file("./spec/day2/input.txt")

    answer = Day2Part1.solve(input)

    expect(answer).to   eq(2150351)
  end
end
