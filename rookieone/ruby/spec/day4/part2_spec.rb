require "./code/day4/part2"
require "./code/day4/file_reader"

RSpec.describe "Day 4 Part 2" do
  it "example should return answer" do
    input = Day4FileReader.read_file("./spec/day4/example.txt")
    
    answer = Day4Part2.solve(input)

    expect(answer).to   eq(1924)
  end

  it "input should return answer" do
    input = Day4FileReader.read_file("./spec/day4/input.txt")
    
    answer = Day4Part2.solve(input)

    expect(answer).to   eq(1284)
  end
end
