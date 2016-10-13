class CreateWords < ActiveRecord::Migration
  def change
    create_table :Anagrams do |t|
      t.string :word
      t.string :canonical_word
    end
  end
end
