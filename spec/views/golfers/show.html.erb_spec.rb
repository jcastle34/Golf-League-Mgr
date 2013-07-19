require 'spec_helper'

describe "golfers/show" do
  before(:each) do
    @golfer = assign(:golfer, stub_model(Golfer,
      :first_name => "First Name",
      :last_name => "Last Name",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/1/)
  end
end
