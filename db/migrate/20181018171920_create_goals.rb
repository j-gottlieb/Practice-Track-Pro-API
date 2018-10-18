class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.integer :daily
      t.integer :weekly
      t.integer :monthly

      t.timestamps
    end
  end
end
