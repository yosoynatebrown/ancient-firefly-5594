require 'rails_helper'

RSpec.describe 'Teams index page' do
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

    visit '/teams'
  end

  it 'should have the name and hometown of all Teams' do
    expect(page).to have_content(@team1.nickname)
    expect(page).to have_content(@team2.nickname)
    expect(page).to have_content(@team3.nickname)
    expect(page).to have_content(@team1.hometown)
    expect(page).to have_content(@team2.hometown)
    expect(page).to have_content(@team3.hometown)
  end

  it 'should have the names and ages of players on the team' do 
    within "#team-#{@team1.id}" do
      expect(page).to have_content(@player1.name)
      expect(page).to have_content(@player1.age)
    end
    within "#team-#{@team2.id}" do
      expect(page).to have_content(@player3.name)
      expect(page).to have_content(@player3.age)
    end

    within "#team-#{@team3.id}" do
      expect(page).to have_content(@player5.name)
      expect(page).to have_content(@player5.age)
    end
  end

  it 'should have teams sorted by average age' do
    save_and_open_page
    expect(@team3.nickname).to appear_before(@team2.nickname)
    expect(@team2.nickname).to appear_before(@team1.nickname)
  end
end