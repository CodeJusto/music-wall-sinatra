class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t| 
      t.references :users
      t.references :songs
    end
  end
end
