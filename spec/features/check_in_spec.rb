require 'rails_helper'
require 'pry'

def login_via_form(email)
  visit("/users/sign_in")

  find("#user_email").fill_in with: email
  find('#user_password').fill_in with: "password"
  click_button "Log in"
end

RSpec.feature "CheckIns", type: :feature do
  fixtures :users, :user_action_steps, :action_steps

  let!(:user) { users(:check_in) }

  before do
    login_via_form(user.email)
  end

  describe "allows me to check in" do
    it "shows the check in list" do
      visit "/check_in"

      expect(page).to(have_text("Check In Now"))
    end

    it "lets me check off an action step as a client" do
      visit "/check_in"

      click_link("client client")

      expect(page).to(have_text("This week: 1 / 2"))
      expect(page).to(have_text("All time: 2 / 3"))


      find(".open-step").click

      expect(page).to have_selector(".closed-step", count: 2)
    end

    it "lets me uncheck an action step as a client" do
      visit "/check_in"

      click_link("client client")

      expect(page).to(have_text("This week: 1 / 2"))
      expect(page).to(have_text("All time: 2 / 3"))


      find(".closed-step").click

      expect(page).to have_selector(".open-step", count: 2)
    end
  end
end
