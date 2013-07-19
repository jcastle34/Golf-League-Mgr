require 'spec_helper'

describe "golfers/edit" do
  before(:each) do
    @golfer = assign(:golfer, stub_model(Golfer,
      :first_name => "MyString",
      :last_name => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit golfer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", golfer_path(@golfer), "post" do
      assert_select "input#golfer_first_name[name=?]", "golfer[first_name]"
      assert_select "input#golfer_last_name[name=?]", "golfer[last_name]"
      assert_select "input#golfer_user_id[name=?]", "golfer[user_id]"
    end
  end
end
