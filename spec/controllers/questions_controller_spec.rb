require 'spec_helper'

describe QuestionsController do
  let!(:user) { User.create(name: "Nick", email: "nick@nick.com", password: "nick") }
  let!(:test_question) { Question.create(title: "Dogs", description: "Dogs are the best", user: user) }
  let!(:test_answer1) { Answer.create(description: "I hate your question.", user: user, question: test_question) }
  let!(:test_answer2) { Answer.create(description: "I hate your question too.", user: user, question: test_question) }

  describe "show" do
    let(:request_params){{id:test_question.id}}

    it "returns status 200" do
      get :show, request_params
      expect(response.status).to eq(200)
    end

    it "should assign question from url to @question" do
      get :show, request_params
      expect(assigns(:question)).to eq(test_question)
    end

    it "should assign question's answers to @answers" do
      get :show, request_params
      expect(assigns(:answers)).to eq([test_answer1, test_answer2])
    end

  end

  describe "new" do

    it "should send user to new question form if logged in" do
      get :new
      expect(response.status).to eq(200)
    end

    it "should redirect to root index if user not logged in" do
      get :new
      expect(response.status).to eq(302)
    end
  end

  # REVIEW: you know what I'm about to write.
  describe "create" do
    # before(:each) do
    #   post login_path, :login => user.login, :password => 'password'
    #   request_params = {question: {title: "Create Title", description: "Create description."} }
    # end

    it "exists" do
      pending
      # post :create, request_params
      # expect(response.status).to eq(302)
    end

    it "creates a new question" do
      pending
      # post :create, request_params
      # expect(assigns(:question)).to eq(Question.find_by_title("Create Title"))
    end

  end

end
