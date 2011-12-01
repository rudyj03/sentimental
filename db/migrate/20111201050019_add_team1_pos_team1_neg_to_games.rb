class AddTeam1PosTeam1NegToGames < ActiveRecord::Migration
  def self.up
    add_column :games, :team1_pos, :integer, :default => 0
    add_column :games, :team1_neg, :integer, :default => 0
  end

  def self.down
    remove_column :games, :team1_neg
    remove_column :games, :team1_pos
  end
end
