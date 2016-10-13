# Este archivo sirve para correr código que te permita 
# rellenar tu base de datos con información. 

module WordSeeds
  def self.import(filename=File.dirname(__FILE__) + "/../words")
    field_names = ["word", "canonical_word"]
    puts "estoy aqui"
    Word.transaction do 
      File.open(filename).each do |line|

        data = [line.chomp, line.chomp.downcase.chars.sort.join("")]
        attribute_hash = Hash[field_names.zip(data)]
        word = Word.create!(attribute_hash)
      end
    end
  end
end

WordSeeds.import 