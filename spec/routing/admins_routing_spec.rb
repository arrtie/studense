require "rails_helper"

RSpec.describe AdminsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/admins").to route_to("admins#index")
    end

    it "routes to #new" do
      expect(get: "/admins/new").to route_to("admins#new")
    end

    it "routes to #show" do
      expect(get: "/admins/1").to route_to("admins#show", id: "1")
    end

    describe "#edit" do
      it "routes unknown paths to errors#route_not_found" do
        expect(get: "/admins/1/edit").to route_to(
          controller: "application",
          action: "not_found_method",
          unmatched: "admins/1/edit"
        )
      end
    end

    it "routes to #create" do
      expect(post: "/admins").to route_to("admins#create")
    end

    describe "#update" do
      context "PATCH" do
        it "routes unknown paths to errors#route_not_found" do
          expect(patch: "/admins/1/update").to route_to(
            controller: "application",
            action: "not_found_method",
            unmatched: "admins/1/update"
          )
        end
      end

      context "PUT" do
        it "routes unknown paths to errors#route_not_found" do
          expect(put: "/admins/1/update").to route_to(
            controller: "application",
            action: "not_found_method",
            unmatched: "admins/1/update"
          )
        end
      end

      context "GET" do
        it "routes unknown paths to errors#route_not_found" do
          expect(get: "/admins/1/update").to route_to(
            controller: "application",
            action: "not_found_method",
            unmatched: "admins/1/update"
            )
        end
      end
    end

    it "routes to #destroy" do
      expect(delete: "/admins/1").to route_to("admins#destroy", id: "1")
    end
  end
end
