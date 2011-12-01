class AddSinceIdToGames < ActiveRecord::Migration
  def self.up
    add_column :games, :since_id, :integer
  end

  def self.down
    remove_column :games, :since_id
  end
end
