class AddTeam2PosTeam2NegToGames < ActiveRecord::Migration
  def self.up
    add_column :games, :team2_pos, :integer, :default => 0
    add_column :games, :team2_neg, :integer, :default => 0
  end

  def self.down
    remove_column :games, :team2_neg
    remove_column :games, :team2_pos
  end
end
