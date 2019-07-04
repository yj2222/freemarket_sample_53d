class RemoveMonthFromCredits < ActiveRecord::Migration[5.2]
  def change
    remove_column :credits, :month, :integer
  end
end
