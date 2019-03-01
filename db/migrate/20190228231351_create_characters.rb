class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :house
      t.boolean :male
      t.string :culture
      t.string :imageLink

      t.timestamps
    end
  end
end
