class TeamsController < ApplicationController
  def index
    @teams = Team.sorted_by_average_age
  end
end