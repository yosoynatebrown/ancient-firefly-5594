require 'rails_helper'

RSpec.describe Team do
  describe 'relationships' do
    it { should have_many(:players) }
    it { should have_many(:team_competitions) }
    it {should have_many(:competitions).through(:team_competitions)}
  end
before(:each) do
    @team1 = create(:team)


    @player3 = create(:player, team: @team1, age: 25)
    @player4 = create(:player, team: @team1, age: 30)
end

  describe 'instance methods' do 
    describe '#average_age' do 
      it 'should calculate average age of all players in team' do 
        expect(@team1.average_age).to eq(27.5)
      end
    end
  end
end
