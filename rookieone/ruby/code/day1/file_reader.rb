class Day1FileReader
  def self.read_file(file_path)
    file = File.open(file_path)

    file.readlines.map do |number|
      number.to_i
    end
  end
end
