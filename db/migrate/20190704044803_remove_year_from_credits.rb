class RemoveYearFromCredits < ActiveRecord::Migration[5.2]
  def change
    remove_column :credits, :year, :integer
  end
end
