require "rails_helper"

RSpec.describe LensesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/lenses").to route_to("lenses#index")
    end

    it "routes to #show" do
      expect(get: "/lenses/1").to route_to("lenses#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/lenses").to route_to("lenses#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/lenses/1").to route_to("lenses#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/lenses/1").to route_to("lenses#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/lenses/1").to route_to("lenses#destroy", id: "1")
    end
  end
end
