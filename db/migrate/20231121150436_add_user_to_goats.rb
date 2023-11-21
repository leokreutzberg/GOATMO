class AddUserToGoats < ActiveRecord::Migration[7.1]
  def change
    add_reference :goats, :user, foreign_key: true
  end
end
