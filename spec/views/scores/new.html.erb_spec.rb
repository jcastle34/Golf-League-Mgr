require 'spec_helper'

describe "scores/new" do
  before(:each) do
    assign(:score, stub_model(Score,
      :hole => 1,
      :strokes => 1,
      :match_id => 1,
      :golfer_id => 1
    ).as_new_record)
  end

  it "renders new score form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", scores_path, "post" do
      assert_select "input#score_hole[name=?]", "score[hole]"
      assert_select "input#score_strokes[name=?]", "score[strokes]"
      assert_select "input#score_match_id[name=?]", "score[match_id]"
      assert_select "input#score_golfer_id[name=?]", "score[golfer_id]"
    end
  end
end
