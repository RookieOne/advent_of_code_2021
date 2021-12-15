class BingoCard
  @last_number = nil

  def initialize(card_input)
    @card_input = card_input
    @rows = @card_input.map do |row|
      row.map do |cell_number|
        {
          number: cell_number,
          marked: false
        }
      end
    end
  end

  def mark_number(number)
    @last_number = number

    @rows.each do |row|
      row.each do |cell|
        if cell[:number] == number
          cell[:marked] = true
        end
      end
    end
  end

  def winner?
    horizontal_winner? || vertical_winner?
  end

  def horizontal_winner?
    @rows.any? do |row|
      row.all? {|row| row[:marked]}
    end
  end

  def vertical_winner?
    card_size = @rows[0].length

    (0..card_size - 1).any? do |index|
      @rows.all? do |row|
        row[index][:marked]
      end
    end
  end

  def score
    unmarked_numbers = []
    @rows.each do |row|
      row.each do |cell|
        unless cell[:marked]
          unmarked_numbers << cell[:number]
        end
      end
    end

    unmarked_numbers.sum() * @last_number
  end

  def debug
    p "#####"
    p @rows.count
    @rows.each do |row|
      line = ""
      row.each do |cell|
        line += cell[:marked] ? "#{cell[:number]}X " : "#{cell[:number]}  "
      end
      p line
    end
    p "#####"
  end
end

class Day4Part2
  def self.solve(input)
    bingo_cards = input[:cards].map{ |card_input| BingoCard.new(card_input) }

    while bingo_cards.count > 1
      number = input[:numbers].shift

      bingo_cards.each{|bc| bc.mark_number(number)}

      bingo_cards = bingo_cards.reject do |bc|
        bc.winner?
      end
    end

    last_card = bingo_cards[0]

    until last_card.winner?
      number = input[:numbers].shift
      last_card.mark_number(number)
    end

    last_card.score
  end
end
