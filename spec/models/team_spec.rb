require 'rails_helper'

RSpec.describe Team do
  describe 'relationships' do
    it { should have_many(:players) }
    it { should have_many(:team_competitions) }
    it {should have_many(:competitions).through(:team_competitions)}
  end
before(:each) do
    @team1 = create(:team)
    @team2 = create(:team)
    @team3 = create(:team)

    @player1 = create(:player, team: @team1, age: 20)
    @player2 = create(:player, team: @team1, age: 22)

    @player3 = create(:player, team: @team2, age: 25)
    @player4 = create(:player, team: @team2, age: 30)

    @player5 = create(:player, team: @team3, age: 31)
    @player6 = create(:player, team: @team3, age: 27)
end

  describe 'class methods' do 
    describe '.average_age' do 
      it 'should calculate average age of all players in team' do 
        expect(Team.average_age).to eq(25.83)
      end
    end
    describe '.sorted_by_average_age' do 
      it 'should sort teams by average age (highest to lowest)' do 
        expect(Team.sorted_by_average_age).to eq([@team3, @team2, @team1])
      end
    end
  end
end
