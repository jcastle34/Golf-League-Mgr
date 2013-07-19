require 'spec_helper'

describe "golfers/index" do
  before(:each) do
    assign(:golfers, [
      stub_model(Golfer,
        :first_name => "First Name",
        :last_name => "Last Name",
        :user_id => 1
      ),
      stub_model(Golfer,
        :first_name => "First Name",
        :last_name => "Last Name",
        :user_id => 1
      )
    ])
  end

  it "renders a list of golfers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
