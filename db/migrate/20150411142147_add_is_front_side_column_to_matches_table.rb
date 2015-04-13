class AddIsFrontSideColumnToMatchesTable < ActiveRecord::Migration
  def change
    add_column :matches, :is_front_side, :boolean
  end
end
