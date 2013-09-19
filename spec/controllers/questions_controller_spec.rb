require 'spec_helper'

describe QuestionsController do
  let!(:user) { User.create(name: "Nick", email: "nick@nick.com") }
    let!(:test_question) { Question.create(title: "Dogs", description: "Dogs are the best", user: user) }
    let!(:test_answer1) { Answer.create(description: "I hate your question.", user: user, question: test_question) }
    let!(:test_answer2) { Answer.create(description: "I hate your question too.", user: user, question: test_question) }

  describe "show" do

    it "exists" do
      request_params = {id: test_question.id}
      get :show, request_params
      expect(response.status).to eq(200)
    end

    it "should assign question from url to @question" do
      request_params = {id: test_question.id}
      get :show, request_params
      expect(assigns(:question)).to eq(test_question)
    end

    it "should assign question's answers to @answers" do
      request_params = {id: test_question.id}
      get :show, request_params
      expect(assigns(:answers)).to eq([test_answer1, test_answer2])
    end

  end

  describe "new" do

    it "exists" do
      get :new
      expect(response.status).to eq(200)
    end

    it "should check to see if a user is logged in"

  end

  describe "create" do

    it "exists"

    it "creates a new question"

  end

end
