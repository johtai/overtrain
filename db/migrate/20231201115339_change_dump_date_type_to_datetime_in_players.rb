class ChangeDumpDateTypeToDatetimeInPlayers < ActiveRecord::Migration[7.0]
  def change
    change_column :players, :dump_date, :datetime
  end
end
