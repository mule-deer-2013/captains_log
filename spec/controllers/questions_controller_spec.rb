require 'spec_helper'

describe QuestionsController do
  describe "show" do

    it "exists" do
      get :show
      expect(response.status).to eq(200)
    end

    it "should assign question from url to @question"

    it "should assign question's answers to @answers"

  end

end
