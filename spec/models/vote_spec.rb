require 'spec_helper'

describe Vote do
  it { should belong_to(:user) }
  it { should belong_to(:votable) }
  it { should validate_presence_of(:up) }
  it { should validate_presence_of(:down)}
  it { should validate_presence_of(:votable_id) }
  it { should validate_presence_of(:votable_type) }
end
