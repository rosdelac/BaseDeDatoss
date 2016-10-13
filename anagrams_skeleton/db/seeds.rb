# Este archivo sirve para correr código que te permita 
# rellenar tu base de datos con información.
module WordSeeds
  def self.import(filename=File.dirname(__FILE__) + "/../words")
    field_names = ["word, canonical_word"]
    Word.transaction do
      File.open(filename).each do |line|
        data = line.chomp.split(',')
        if field_names.nil?
          field_names = data
        else
          attribute_hash = Hash[field_names.zip(data)]
          word = Word.create!(attribute_hash)
        end
      end
    end
  end
end# Este archivo sirve para crear registros de prueba
WordSeeds.import
