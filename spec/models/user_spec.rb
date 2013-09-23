require 'spec_helper'
describe User do

  describe 'associations' do
    it { should have_many(:questions)}
    it { should have_many(:answers)}
  end

  describe 'validations' do
    pending # pending tests are evil
  end

  describe '.find_by_email' do
    pending # pending tests are evil
  end


  context "#save" do
    # REVIEW: use factory girl
    let(:user) {User.new(name: "Bonzo", email: "me@example.com")}

    it { should validate_presence_of :name }
    it "must have a name" do
      user.name = nil
      expect(user).to be_invalid
      user.save
      expect(user.errors).to include("Name can't be blank")
      expect {
        user.save
      }.not_to change(User, :count)
      expect { user.save! }.to raise_error # bad test, why use ! and be specific about which errors
    end
  end
end
