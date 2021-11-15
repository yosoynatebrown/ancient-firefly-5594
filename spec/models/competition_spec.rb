require 'rails_helper'

RSpec.describe Competition, type: :model do
  it { should have_many(:team_competitions) }
  it {should have_many(:teams).through(:team_competitions)}
 before(:each) do
    @competition = create(:competition)
    
    @team1, @team2, @team3 = create_list(:team, 3)

    @competition.teams << @team1
    @competition.teams << @team2
    @competition.teams << @team3

    @player1 = create(:player, team: @team1, age: 20)
    @player2 = create(:player, team: @team1, age: 22)

    @player3 = create(:player, team: @team2, age: 25)
    @player4 = create(:player, team: @team2, age: 30)

    @player5 = create(:player, team: @team3, age: 31)
    @player6 = create(:player, team: @team3, age: 27)
  end
  describe 'instance methods' do 
    describe '#average_age_of_players' do 
      it 'should calculate average age of all players in competition to 2 decimal places' do 
        expect(@competition.average_age_of_players).to eq(25.83)
      end
    end
  end
end
