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

    it "lets me edit a user" do
      visit "/users"

      click_link("client client")

      find('#user_first_name').fill_in(with: 'Spackle')
      find('#user_last_name').fill_in(with: 'Grackle')
      find('#user_email').fill_in(with: 'spackle@grackle.com')

      click_button("Update User")

      expect(page).to have_text("Spackle Grackle")
      expect(page).to have_field("user[email]", with: "spackle@grackle.com")
    end

    it "can add a user" do
      visit "/users/new"

      fill_in('First name', with: 'Amanda')
      fill_in('Last name', with: 'DePanda')
      fill_in('Email', with: 'amandadepanda@gmail.com')
      fill_in('Password', with: 'abc123')
      fill_in('Confirm', with: 'abc123')

      click_button("Create User")

      expect(find('.user-list')).to have_text('Amanda DePanda')
    end

		it "can add default action steps" do
      visit "/users"

      click_link("client client")

			click_button("Schedule upcoming cards")

      select("HICT", from: "action_steps[]")
      fill_in('starting_at', with: 1.day.ago.strftime("%Y-%m-%d"))
			click_button('Save schedule')

			expect(find('.list-group-item')).to have_text('HICT')
		end

    it "lets me add a current action step" do
      visit "/users"

      click_link("client client")
			click_button("Add a card")

      select("HICT", from: "action_step_id[]")
      fill_in('active_date', with: 1.day.ago.strftime("%Y-%m-%d"))
      fill_in('expiration_date', with: 1.week.from_now.strftime("%Y-%m-%d"))

      click_button("Save card")

      expect(find('.current')).to have_text('HICT')
    end

    it "lets me add a past action step" do
      visit "/users"

      click_link("client client")

      select("HICT", from: "action_step_id[]")
      fill_in('active_date', with: 3.weeks.ago.strftime("%Y-%m-%d"))
      fill_in('expiration_date', with: 2.weeks.ago.strftime("%Y-%m-%d"))

      click_button("Save card")

      expect(find('.past')).to have_text('HICT')
    end
  end
end
