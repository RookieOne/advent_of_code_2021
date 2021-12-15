require "./code/day4/part1"
require "./code/day4/file_reader"

RSpec.describe "Day 4 Part 1" do
  it "example should return answer" do
    input = Day4FileReader.read_file("./spec/day4/example.txt")
    
    answer = Day4Part1.solve(input)

    expect(answer).to   eq(4512)
  end

  it "input should return answer" do
    input = Day4FileReader.read_file("./spec/day4/input.txt")
    
    answer = Day4Part1.solve(input)

    expect(answer).to   eq(11536)
  end
end
