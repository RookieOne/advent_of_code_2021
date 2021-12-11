class Day1Part1
  def self.solve(numbers)
    total_increases = 0
    previous_depth = nil

    numbers.each do |depth|
      if previous_depth != nil && previous_depth < depth
        total_increases += 1
      end

      previous_depth = depth
    end
    
    total_increases
  end
end
