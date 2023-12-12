class ChangeNicknameToUserIdInUser < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :nickname, :user_id
  end
end
