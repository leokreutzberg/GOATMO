class CreateGoatsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :goats do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.string :location

      t.timestamps
    end
  end
end
