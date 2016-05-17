class ColumnFix < ActiveRecord::Migration
  def change
    change_table :votes do |t|
      t.rename :users_id, :user_id
      t.rename :songs_id, :song_id
    end
  end
end
