class Team < ApplicationRecord
  has_many :players
  has_many :team_competitions
  has_many :competitions, through: :team_competitions

  def self.average_age
    Team.joins(:players).average(:age)
  end
end
