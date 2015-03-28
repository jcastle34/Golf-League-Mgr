require 'spec_helper'

describe "league_teams/show" do
  before(:each) do
    @league_team = assign(:league_team, stub_model(LeagueTeam,
      :name => "Name",
      :league_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
  end
end
