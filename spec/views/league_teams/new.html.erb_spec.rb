require 'spec_helper'

describe "league_teams/new" do
  before(:each) do
    assign(:league_team, stub_model(LeagueTeam,
      :name => "MyString",
      :league_id => 1
    ).as_new_record)
  end

  it "renders new league_team form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", league_teams_path, "post" do
      assert_select "input#league_team_name[name=?]", "league_team[name]"
      assert_select "input#league_team_league_id[name=?]", "league_team[league_id]"
    end
  end
end
