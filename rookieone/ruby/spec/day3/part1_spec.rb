require "./code/day3/part1"
require "./code/day3/file_reader"

RSpec.describe "Day 3 Part 1" do
  it "example should be 198" do
    input = Day3FileReader.read_file("./spec/day3/example.txt")

    answer = Day3Part1.solve(input)

    expect(answer[:gamma_bit_string]).to   eq("10110")
    expect(answer[:epsilon_bit_string]).to   eq("01001")

    expect(answer[:gamma_rate]).to   eq(22)
    expect(answer[:epsilon_rate]).to   eq(9)

    expect(answer[:power_consumption]).to   eq(198)
  end

  it "input should return answer" do
    input = Day3FileReader.read_file("./spec/day3/input.txt")

    answer = Day3Part1.solve(input)

    expect(answer[:gamma_bit_string]).to   eq("000010111101")
    expect(answer[:epsilon_bit_string]).to   eq("111101000010")

    expect(answer[:gamma_rate]).to   eq(189)
    expect(answer[:epsilon_rate]).to   eq(3906)

    expect(answer[:power_consumption]).to   eq(738234)
  end
end
