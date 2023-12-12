class CreateHeros < ActiveRecord::Migration[7.0]
  def change
    create_table :heros do |t|
      t.string :hero_id
      t.string :name
      t.string :desc
      t.string :portrait
      t.string :role
      t.string :location
      t.json :hitpoints
      t.json :abilities
      t.json :story

      t.timestamps
    end
  end
end
