class AddTypeToPractices < ActiveRecord::Migration[5.2]
  def change
    add_column :practices, :practice_type, :string
  end
end
