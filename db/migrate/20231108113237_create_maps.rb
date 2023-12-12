class CreateMaps < ActiveRecord::Migration[7.0]
  def change
    create_table :maps do |t|
      t.string :name
      t.string :screenshot
      t.json :gamemodes
      t.string :location
      t.string :country_code

      t.timestamps
    end
  end
end
