class Day2FileReader
  def self.read_file(file_path)
    file = File.open(file_path)

    file.readlines.map do |line|
      line
    end
  end
end
