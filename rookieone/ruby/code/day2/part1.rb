class Day2Part1
  def self.solve(lines)
    horizontal_position = 0
    depth = 0

    lines.each do |line|
      words = line.split(" ")
      command = words[0]
      number = words[1].to_i

      case command
      when "forward"
        horizontal_position += number
      when "up"
        depth -= number
      when "down"
        depth += number
      end
    end

    horizontal_position * depth
  end
end
