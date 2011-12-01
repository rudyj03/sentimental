class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.text :team1_classifier
      t.text :team2_classifier
      t.date :game_day
      t.string :team1_name
      t.string :team2_name

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
