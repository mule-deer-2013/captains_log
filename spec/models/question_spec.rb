require 'spec_helper'

describe Question do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:answers) }
  end

  it "should have more tests"
end
