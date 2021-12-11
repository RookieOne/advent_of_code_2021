class Day3Part2
  def self.solve(numbers)
    # numbers
    # [
    #   "00100",
    #   "11110",
    #   "10110",
    #   "10111"
    # ]

    oxygeon_rating = get_oxygen_rating(numbers)
    co2_rating = get_co2_rating(numbers)

    oxygeon_number = oxygeon_rating.to_i(2)
    co2_number = co2_rating.to_i(2)

    life_support_rating = oxygeon_number * co2_number

    {
      oxygeon_rating: oxygeon_rating,
      oxygeon_number: oxygeon_number,
      co2_rating: co2_rating,
      co2_number: co2_number,
      life_support_rating: life_support_rating
    }
  end

  def self.get_oxygen_rating(numbers)
    number_of_digits = numbers[0].length

    filtered_numbers = numbers

    (0..(number_of_digits - 1)).each do |i|
      number_of_ones = 0
      number_of_zeroes = 0

      filtered_numbers.each do |number|
        if number[i] == "1"
          number_of_ones += 1
        else
          number_of_zeroes += 1
        end
      end

      most_common_bit = "1"

      if number_of_ones < number_of_zeroes
        most_common_bit = "0"
      end

      filtered_numbers = filtered_numbers.filter do |number|
        number[i] == most_common_bit
      end
    end
    
    filtered_numbers.first
  end

  def self.get_co2_rating(numbers)
    number_of_digits = numbers[0].length

    filtered_numbers = numbers

    (0..(number_of_digits - 1)).each do |i|
      number_of_ones = 0
      number_of_zeroes = 0

      filtered_numbers.each do |number|
        if number[i] == "1"
          number_of_ones += 1
        else
          number_of_zeroes += 1
        end
      end

      least_common_bit = "0"

      if number_of_ones < number_of_zeroes
        least_common_bit = "1"
      end

      filtered_numbers = filtered_numbers.filter do |number|
        number[i] == least_common_bit
      end

      if filtered_numbers.count == 1
        break
      end
    end
    
    filtered_numbers.first
  end
end
