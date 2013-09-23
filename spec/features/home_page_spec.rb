require 'spec_helper'

# i think i misnamed this file, and i KNOW i misnamed the
#describe in line 5
# features are bigger than controllers.
describe UsersController do
  describe 'home page' do
    it "should display error when non-logged in user attempts to create question" do
      visit root_path
      click_link "Create new question"
      expect(page).to have_text("Must login to create question")
    end

  end
end
