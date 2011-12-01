# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Game.delete_all

Game.create(
                :game_day => '12/04/11',
                :team1_name => 'Miami Dolphins',
                :team2_name => 'Oakland Raiders'
            )
