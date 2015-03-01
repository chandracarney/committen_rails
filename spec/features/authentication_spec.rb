require "rails_helper"

RSpec.describe "Authentication flow", type: :feature do
  it "can authenticate with github" do
    visit root_path
    click_link_or_button "Sign in with Github"

    expect(page).to have_text("jimmy")
    expect(page).to have_text("Sign out")
  end

  it "can signout" do
    visit root_path
    click_link_or_button "Sign in with Github"
    click_link_or_button "Sign out"

    expect(page).to have_text("Sign in with Github")
  end
end
