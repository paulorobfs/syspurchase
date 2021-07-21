require 'rails_helper'

RSpec.describe "purchases/edit", type: :view do
  before(:each) do
    @purchase = assign(:purchase, Purchase.create!(
      :user => nil,
      :item => nil,
      :price => "",
      :count => 1
    ))
  end

  it "renders the edit purchase form" do
    render

    assert_select "form[action=?][method=?]", purchase_path(@purchase), "post" do

      assert_select "input[name=?]", "purchase[user_id]"

      assert_select "input[name=?]", "purchase[item_id]"

      assert_select "input[name=?]", "purchase[price]"

      assert_select "input[name=?]", "purchase[count]"
    end
  end
end
