require 'spec_helper'

describe "handicaps/new" do
  before(:each) do
    assign(:handicap, stub_model(Handicap,
      :score => 1,
      :golfer_id => 1,
      :league_id => 1
    ).as_new_record)
  end

  it "renders new handicap form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", handicaps_path, "post" do
      assert_select "input#handicap_score[name=?]", "handicap[score]"
      assert_select "input#handicap_golfer_id[name=?]", "handicap[golfer_id]"
      assert_select "input#handicap_league_id[name=?]", "handicap[league_id]"
    end
  end
end
