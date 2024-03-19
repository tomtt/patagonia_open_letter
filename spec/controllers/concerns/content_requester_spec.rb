require "rails_helper"

RSpec.describe ContentRequester do
  describe ApplicationController, type: :controller do

    controller do
      include ContentRequester

      def fake_action
        @test_content = content_for_key("test_key")
        render plain: "OK"
      end
    end

    before { routes.draw { get "/fake_action" => "anonymous#fake_action" } }

    describe "#content_for_key" do
      it "returns a warning message if content is not present" do
        expect(ContentBlock).to receive(:find_by_key).with("test_key").and_return nil
        get :fake_action

        expect(assigns["test_content"]).to eq("**Here will be the content for \"test_key\"**")
      end

      it "returns the content for the found ContentBlock" do
        content_block = ContentBlock.new(key: "test_key", content: "test content")
        expect(ContentBlock).to receive(:find_by_key).with("test_key").and_return content_block
        get :fake_action

        expect(assigns["test_content"]).to eq("test content")
      end
    end
  end
end
