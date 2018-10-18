class AddUserToPractices < ActiveRecord::Migration[5.2]
  def change
    add_reference :practices, :user, foreign_key: true
  end
end
