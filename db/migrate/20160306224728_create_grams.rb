class CreateGrams < ActiveRecord::Migration
  def change
    create_table :grams do |t|
      t.text :message
      
      t.timestamps
    end
  end
end
