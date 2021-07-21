require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :admin => false,
        :name => "Name"
      ),
      User.create!(
        :admin => false,
        :name => "Name"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end