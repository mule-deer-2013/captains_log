require 'spec_helper'


describe HomeController do
  describe "index" do
    let!(:user) { User.create(name: "Nick", email: "nick@nick.com") }
    let!(:question) { Question.create(title: "Dogs", description: "Dogs are the best", user: user) }

    it "exists" do
      get :index
      expect(response.status).to eq(200)
    end

    it "should assign all questions to @questions" do
      get :index
      expect(assigns(:questions)).to eq([question])
    end


  end 
end 
