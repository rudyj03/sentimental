class WelcomeController < ApplicationController

  def index
    @game = Game.all.first

    @team1_ratio = @game.team1_pos.to_f / @game.team1_neg.to_f
    @team2_ratio = @game.team2_pos.to_f / @game.team2_neg.to_f

    if(@team1_ratio > @team2_ratio)
      @winner = @game.team1_name
    else
      @winner = @game.team2_name
    end
  end

end
