class AddPrepTimeToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :prep_time, :string
  end
end
