class AddDumpDateToPlayers < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :dump_date, :date
  end
end