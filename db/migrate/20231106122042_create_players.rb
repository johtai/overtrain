class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.float :kda
      t.float :winrate
      t.float :avg_elim
      t.float :avg_ass
      t.float :avg_death
      t.float :avg_dam
      t.float :avg_heal

      t.timestamps
    end
  end
end
