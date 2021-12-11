require "./code/day2/part2"
require "./code/day2/file_reader"

RSpec.describe "Day 2 Part 2" do
  it "example should be 900" do
    input = Day2FileReader.read_file("./spec/day2/example.txt")

    answer = Day2Part2.solve(input)

    expect(answer).to   eq(900)
  end

  it "input should return answer" do
    input = Day2FileReader.read_file("./spec/day2/input.txt")

    answer = Day2Part2.solve(input)

    expect(answer).to   eq(1842742223)
  end
end
