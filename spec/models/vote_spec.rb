require 'spec_helper'

describe Vote do
  context "#create" do
    it "should create an instance of a vote" do
      user = double("user")
      user.stub()
      expect(Vote.create(up_down: 1, votable_id: 1, votable_type: "Question", user_id: 1)).to be_an_instance_of Vote
    end
  end
end