require 'rails_helper'

RSpec.describe 'Competition show page' do
  before(:each) do
    @competition = create(:competition)

    @team1 = create(:team)
    @team2 = create(:team)
    @team3 = create(:team)
    @team4 = create(:team)

    @competition.teams << @team1
    @competition.teams << @team2
    @competition.teams << @team3

    @player1 = create(:player, team: @team1, age: 20)
    @player2 = create(:player, team: @team1, age: 22)

    @player3 = create(:player, team: @team2, age: 25)
    @player4 = create(:player, team: @team2, age: 30)

    @player5 = create(:player, team: @team3, age: 31)
    @player6 = create(:player, team: @team3, age: 27)

    visit "/competitions/#{@competition.id}"
  end

  it 'should have competition name, location, and sport' do
    expect(page).to have_content(@competition.name)
    expect(page).to have_content(@competition.location)
    expect(page).to have_content(@competition.sport)
  end

  it 'should have the nickname and hometown of every team in competition' do
    expect(page).to have_content(@team1.nickname)
    expect(page).to have_content(@team2.nickname)
    expect(page).to have_content(@team3.nickname)
    expect(page).to have_content(@team1.hometown)
    expect(page).to have_content(@team2.hometown)
    expect(page).to have_content(@team3.hometown)
  end

  it 'should have the average age of players' do 
    expect(page).to have_content(25.83)
  end

  it 'should have a text field to enter a team name and add to competition' do 
    fill_in 'Nickname', with: "#{@team4.nickname}"
    
    click_button 'Submit'

    expect(current_path).to eq("/competitions/#{@competition.id}")
    expect(page).to have_content(@team4.nickname)
  end
end