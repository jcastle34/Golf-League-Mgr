class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :score_id
      t.float :amount

      t.timestamps
    end
  end
end
