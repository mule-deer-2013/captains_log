require 'spec_helper'


describe HomeController do
  describe "homepage" do
    let!(:user) { User.create(name: "Nick", email: "nick@nick.com") }
    let!(:question) { Question.create(title: "Dogs", description: "Dogs are the best", user: user) }

    it "exists" do
      get :index
      expect(response.status).to eq(200)
    end

    it "should display a list of all questions" do
      get :index
      expect(response.body).to include(Question.first.title)
    end


  end 
end 
