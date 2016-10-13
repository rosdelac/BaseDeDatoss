class Word < ActiveRecord::Base
  # Remember to create a migration!
  def self.anagrams(canonical_word,word)
    array = []
    array = Word.where(canonical_word: canonical_word).pluck(:word)
    array.delete(word)
    if array.size == 0
      return "TU PALABRA NO TIENE ANAGRAMAS"
    else
      return "LOS ANAGRAMAS DE TU PALABRA SON: #{array.join(",")}"
    end
  end
end

