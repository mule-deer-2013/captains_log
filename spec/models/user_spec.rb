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


end
