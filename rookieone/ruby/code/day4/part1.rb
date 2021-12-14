class BingoCard
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

  end

  def winner?
    false
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

class Day4Part1
  def self.solve(input)

    bingo_cards = input[:cards].map{ |card_input| BingoCard.new(card_input) }

    bingo_cards[0].debug

    unless bingo_cards.any?{|bc| bc.winner?}
      number = input[:numbers].shift

      bingo_cards.each{|bc| bc.mark_number(number)}
    end

    0
  end
end
