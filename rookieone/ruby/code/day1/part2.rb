class Day1Part2
  def initialize(numbers)
    @depths = create_depths(numbers)
  end

  def create_depths(numbers)
    depth_window = []
    depths = numbers.map.with_index do |current_depth, i|
      if i > 1
        numbers[i-2..i].sum()
      else
        nil
      end
    end.compact()
  end

  def solve()
    total_increases = 0
    previous_depth = nil

    @depths.each do |depth|
      if previous_depth != nil && previous_depth < depth
        total_increases += 1
      end

      previous_depth = depth
    end
    
    total_increases
  end
end
