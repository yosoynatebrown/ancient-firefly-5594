class Team < ApplicationRecord
  has_many :players
  has_many :team_competitions
  has_many :competitions, through: :team_competitions

  def average_age
    players.average(:age)
  end
end
