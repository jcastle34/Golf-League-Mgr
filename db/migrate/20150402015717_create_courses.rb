class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :zip_code
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
