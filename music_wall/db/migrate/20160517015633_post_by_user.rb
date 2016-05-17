class PostByUser < ActiveRecord::Migration
  def change
    change_table :songs do |t|
      t.string :posted_by
    end
  end
end
