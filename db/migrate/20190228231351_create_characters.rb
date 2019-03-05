class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :url
      t.string :name
      t.string :house
      t.string :gender
      t.string :culture
      t.string :playedBy

      t.timestamps
    end
  end
end
