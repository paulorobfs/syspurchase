require 'rails_helper'

RSpec.describe "merchants/index", type: :view do
  before(:each) do
    assign(:merchants, [
      Merchant.create!(
        :name => "Name",
        :address => "Address"
      ),
      Merchant.create!(
        :name => "Name",
        :address => "Address"
      )
    ])
  end

  it "renders a list of merchants" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
  end
end
