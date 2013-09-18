require 'spec_helper'


describe Answer do 
  describe 'associations' do
    it { should belong_to(:question) }
    it { should belong_to(:user) }
  end

  it "should have more tests"
end
