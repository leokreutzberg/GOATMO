class CreateGoats < ActiveRecord::Migration[7.1]
  def change
    create_table :goats do |t|

      t.timestamps
    end
  end
end
