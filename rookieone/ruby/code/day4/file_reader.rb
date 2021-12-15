class Day4FileReader
  def self.read_file(file_path)
    file = File.open(file_path)

    lines = file.readlines.map do |line|
      line.chomp
    end

    numbers = lines[0].split(",").map{|n| n.to_i}

    cards = []
    card = []

    lines.drop(1).each do |line|
      if line == ""
        cards << card
        card = []
      else
        bingo_numbers = line.split(" ").map{|n| n.to_i}
        card << bingo_numbers
      end
    end
    cards << card
    cards = cards.reject {|c| c == []}

    {
      numbers: numbers,
      cards: cards
    }
  end
end
