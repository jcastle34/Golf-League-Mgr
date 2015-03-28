require 'spec_helper'

describe "league_teams/index" do
  before(:each) do
    assign(:league_teams, [
      stub_model(LeagueTeam,
        :name => "Name",
        :league_id => 1
      ),
      stub_model(LeagueTeam,
        :name => "Name",
        :league_id => 1
      )
    ])
  end

  it "renders a list of league_teams" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
