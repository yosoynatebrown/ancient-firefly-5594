class Team < ApplicationRecord
  has_many :players
  has_many :team_competitions
  has_many :competitions, through: :team_competitions

  def self.average_age
    Team.joins(:players).average(:age).round(2)
  end

  def self.sorted_by_average_age
    Team.joins(:players).select('teams.*, AVG(players.age) AS average_player_age')
                          .group('teams.id')
                          .order(average_player_age: :desc)
  end
end
