class CreateGolfers < ActiveRecord::Migration
  def change
    create_table :golfers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :user_id

      t.timestamps
    end
  end
end
