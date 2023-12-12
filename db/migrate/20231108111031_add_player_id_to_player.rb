class AddPlayerIdToPlayer < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :player_id, :string
  end
end
