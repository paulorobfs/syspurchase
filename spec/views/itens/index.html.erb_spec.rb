require 'rails_helper'

RSpec.describe "itens/index", type: :view do
  before(:each) do
    assign(:itens, [
      Item.create!(
        :merchant => nil,
        :description => "Description",
        :price => ""
      ),
      Item.create!(
        :merchant => nil,
        :description => "Description",
        :price => ""
      )
    ])
  end

  it "renders a list of itens" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
