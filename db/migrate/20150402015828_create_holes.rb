class CreateHoles < ActiveRecord::Migration
  def change
    create_table :holes do |t|
      t.integer :number
      t.integer :par
      t.integer :yards
      t.integer :course_id

      t.timestamps
    end
  end
end
