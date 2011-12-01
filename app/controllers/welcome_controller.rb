class WelcomeController < ApplicationController

  def index
    game = Game.all.first
    if(game.team1_pos > game.team2_pos)
      @winner = game.team1_name
    elsif(game.team2_pos > game.team1_pos)
      @winner = game.team2_name
    else
      @winner = "Too close to call!"
    end
  end

end
