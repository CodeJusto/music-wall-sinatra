class CreateSongs < ActiveRecord::Migration
  def change
    create_table "songs" do |t|
      t.string "title"
      t.string "author"
      t.string "url"
      t.timestamp "created_at"
      t.timestamp "updated_at"
    end
  end
end
