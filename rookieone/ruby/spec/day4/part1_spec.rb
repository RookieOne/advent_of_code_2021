require "./code/day4/part1"
require "./code/day4/file_reader"

RSpec.describe "Day 4 Part 1" do
  it "example should return answer" do
    input = Day4FileReader.read_file("./spec/day4/example.txt")
    
    answer = Day4Part1.solve(input)

    p answer
  end
end
