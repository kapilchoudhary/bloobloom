require "rails_helper"

RSpec.describe GlassesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/glasses").to route_to("glasses#index")
    end

    it "routes to #show" do
      expect(get: "/glasses/1").to route_to("glasses#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/glasses").to route_to("glasses#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/glasses/1").to route_to("glasses#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/glasses/1").to route_to("glasses#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/glasses/1").to route_to("glasses#destroy", id: "1")
    end
  end
end
