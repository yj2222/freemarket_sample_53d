class AddScoreToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :good, :integer
    add_column :profiles, :normal, :integer
    add_column :profiles, :bad, :integer
  end
end
