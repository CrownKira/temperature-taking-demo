class AddUserToTemperatures < ActiveRecord::Migration[6.0]
  def change
    add_reference :temperatures, :user, null: false, foreign_key: true, default: 1
  end
end
