require "rails_helper"

RSpec.describe ItensController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/itens").to route_to("itens#index")
    end

    it "routes to #new" do
      expect(:get => "/itens/new").to route_to("itens#new")
    end

    it "routes to #show" do
      expect(:get => "/itens/1").to route_to("itens#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/itens/1/edit").to route_to("itens#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/itens").to route_to("itens#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/itens/1").to route_to("itens#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/itens/1").to route_to("itens#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/itens/1").to route_to("itens#destroy", :id => "1")
    end
  end
end
