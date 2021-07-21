require 'rails_helper'

RSpec.describe "itens/new", type: :view do
  before(:each) do
    assign(:item, Item.new(
      :merchant => nil,
      :description => "MyString",
      :price => ""
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", itens_path, "post" do

      assert_select "input[name=?]", "item[merchant_id]"

      assert_select "input[name=?]", "item[description]"

      assert_select "input[name=?]", "item[price]"
    end
  end
end
