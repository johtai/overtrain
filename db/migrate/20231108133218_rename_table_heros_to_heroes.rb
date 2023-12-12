class RenameTableHerosToHeroes < ActiveRecord::Migration[7.0]
  def change
    rename_table :heros, :heroes
  end
end
