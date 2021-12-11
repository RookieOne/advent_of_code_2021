class Day3Part1
  def self.solve(input)
    gamma_rate = 0

    # input
    # [
    #   "00100",
    #   "11110",
    #   "10110",
    #   "10111"
    # ]

    bit_counts = []

    input[0].length.times do
      bit_counts << {ones: 0, zeroes: 0}
    end

    input.each do |number|
      number.each_char.with_index do |bit, i|
        if bit == "0"
          bit_counts[i][:zeroes] += 1
        else
          bit_counts[i][:ones] += 1
        end
      end
    end

    # bit_counts
    # [
    #   {ones: #, zeroes: #},
    #   {ones: #, zeroes: #},
    #   {ones: #, zeroes: #}...
    #   ...
    # ]

    bit_counts.map do |bit_count|
      if bit_count[:ones] > bit_count[:zeroes]
        bit_count[:gamma] = "1"
        bit_count[:epsilon] = "0"
      else
        bit_count[:gamma] = "0"
        bit_count[:epsilon] = "1"
      end
    end

    # bit_counts with gamma and epsilon
    # [
    #   {ones: #, zeroes: #, gamma: #, epsilon: #},
    #   {ones: #, zeroes: #, gamma: #, epsilon: #},
    #   {ones: #, zeroes: #, gamma: #, epsilon: #}...
    #   ...
    # ]

    gamma_bit_string = ""
    epsilon_bit_string = ""

    bit_counts.each do |bit_count|
      gamma_bit_string += bit_count[:gamma]
      epsilon_bit_string += bit_count[:epsilon]
    end

    # gamma_bit_string 01011
    # epsilon_bit_string 00111

    gamma_rate = gamma_bit_string.to_i(2)
    epsilon_rate = epsilon_bit_string.to_i(2)

    power_consumption = gamma_rate * epsilon_rate

    {
      gamma_bit_string: gamma_bit_string,
      epsilon_bit_string: epsilon_bit_string,
      gamma_rate: gamma_rate,
      epsilon_rate: epsilon_rate,
      power_consumption: power_consumption
    }
  end
end
