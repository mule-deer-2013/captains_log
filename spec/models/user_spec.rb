require 'spec_helper'


describe User do 

  describe 'associations' do
    it { should have_many(:questions)}
    it { should have_many(:answers)}
  end

  describe 'validations' do
    pending
  end

  describe '.find_by_email' do
    pending
  end


  context "#save" do 
    let(:user) {User.new(name: "Bonzo", email: "me@example.com")}

    it "must have a name" do
      user.name = nil
      expect { user.save! }.to raise_error
    end




    
  end

end
