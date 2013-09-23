require 'spec_helper'

feature 'Voting' do
  let!(:user) { create :user }
  let!(:question) { create(:question, user_id: user.id) }
  let!(:answer) { question.answers.create(description: "testing answer", user_id: user.id) }

  before(:each) do
    # answer.question
    # REVIEW: anytime you use a string for internal routes, you're doing it wrong, use named_routes.
    visit "/signin"
    fill_in "session_email", :with => user.email
    fill_in "session_password", :with => "Password"
    click_button "Sign in"
    visit "/questions/#{question.id}"
  end

  scenario "User can see voting choices" do
    find_button('Upvote')
    find_button('Downvote')
  end

  scenario "User can upvote" do
    expect { click_button('Upvote') }.to change{Vote.count}.by(1)
  end

  scenario "User cannot upvote twice"


  scenario "User can downvote" do
    expect { click_button('Downvote') }.to change{Vote.count}.by(1)
  end

  scenario "User cannot downvote twice"

  scenario "User can see vote count" do
    find('#vote_count')
  end

  scenario "Users vote will change vote count"

end
