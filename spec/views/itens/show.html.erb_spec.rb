require 'rails_helper'

RSpec.describe "itens/show", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :merchant => nil,
      :description => "Description",
      :price => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(//)
  end
end
