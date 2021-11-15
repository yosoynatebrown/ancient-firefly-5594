class TeamCompetitionsController < ApplicationController
  def create
    competition = Competition.find(params[:id])
    team = Team.find_by(nickname: params[:nickname])

    TeamCompetition.create(team: team, competition: competition)

    redirect_to "/competitions/#{params[:id]}"
  end
end
