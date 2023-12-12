class CreateGamemodes < ActiveRecord::Migration[7.0]
  def change
    create_table :gamemodes do |t|
      t.string :key
      t.string :name
      t.string :icon
      t.string :desc
      t.string :screenshot

      t.timestamps
    end
  end
end
