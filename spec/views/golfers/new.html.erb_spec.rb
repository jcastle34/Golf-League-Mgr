require 'spec_helper'

describe "golfers/new" do
  before(:each) do
    assign(:golfer, stub_model(Golfer,
      :first_name => "MyString",
      :last_name => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new golfer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", golfers_path, "post" do
      assert_select "input#golfer_first_name[name=?]", "golfer[first_name]"
      assert_select "input#golfer_last_name[name=?]", "golfer[last_name]"
      assert_select "input#golfer_user_id[name=?]", "golfer[user_id]"
    end
  end
end
