require 'rails_helper'
require 'pry'

def login_via_form(email)
  visit("/users/sign_in")

  find("#user_email").fill_in with: email
  find('#user_password').fill_in with: "password"
  click_button "Log in"
end

RSpec.feature "Admin", type: :feature do
  fixtures :users, :user_action_steps, :action_steps

  let!(:user) { users(:admin) }

  before do
    login_via_form(user.email)
  end

  describe "editing users" do
    it "shows the user list" do
      visit "/users"

      expect(page).to(have_text("client client"))
      expect(page).to(have_text("admin admin"))
      expect(page).to(have_text("check_in check_in"))
    end

    it "lets me add a current action step" do
      visit "/users"

      click_link("client client")

      find('#user_first_name').fill_in(with: 'Spackle')
      find('#user_last_name').fill_in(with: 'Grackle')
      find('#user_email').fill_in(with: 'spackle@grackle.com')

      click_button("Update User")

      expect(page).to have_text("Spackle Grackle")
      expect(page).to have_text("spackle@grackle.com")
    end

    it "lets me add a current action step" do
      visit "/users"

      click_link("client client")

      select("HICT", from: "action_step_id[]")
      fill_in('active_date', with: 1.day.ago.strftime("%m/%d/%Y"))
      fill_in('expiration_date', with: 1.week.from_now.strftime("%m/%d/%Y"))

      click_button("Save")

      expect(find('.current')).to have_text('HICT')
    end

    it "lets me add a future action step" do
      visit "/users"

      click_link("client client")

      select("HICT", from: "action_step_id[]")
      fill_in('active_date', with: 1.week.from_now.strftime("%m/%d/%Y"))
      fill_in('expiration_date', with: 2.weeks.from_now.strftime("%m/%d/%Y"))

      click_button("Save")

      expect(find('.future')).to have_text('HICT')
    end

    it "lets me add a past action step" do
      visit "/users"

      click_link("client client")

      select("HICT", from: "action_step_id[]")
      fill_in('active_date', with: 3.weeks.ago.strftime("%m/%d/%Y"))
      fill_in('expiration_date', with: 2.weeks.ago.strftime("%m/%d/%Y"))

      click_button("Save")

      expect(find('.past')).to have_text('HICT')
    end
  end
end
