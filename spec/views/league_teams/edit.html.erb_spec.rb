require 'spec_helper'

describe "league_teams/edit" do
  before(:each) do
    @league_team = assign(:league_team, stub_model(LeagueTeam,
      :name => "MyString",
      :league_id => 1
    ))
  end

  it "renders the edit league_team form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", league_team_path(@league_team), "post" do
      assert_select "input#league_team_name[name=?]", "league_team[name]"
      assert_select "input#league_team_league_id[name=?]", "league_team[league_id]"
    end
  end
end
