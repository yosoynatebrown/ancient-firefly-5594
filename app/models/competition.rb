class Competition < ApplicationRecord
  has_many :team_competitions
  has_many :teams, through: :team_competitions

  def average_age_of_players
   teams.average_age.round(2)
  end
end
