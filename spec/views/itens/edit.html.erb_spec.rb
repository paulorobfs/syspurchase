require 'rails_helper'

RSpec.describe "itens/edit", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :merchant => nil,
      :description => "MyString",
      :price => ""
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

      assert_select "input[name=?]", "item[merchant_id]"

      assert_select "input[name=?]", "item[description]"

      assert_select "input[name=?]", "item[price]"
    end
  end
end
