require "rails_helper"

RSpec.describe "Authentication flow", type: :feature do
  it "can authenticate with github" do
    visit root_path
    click_link "Sign in with Github"

    expect(page).to have_text("jimmy")
    expect(page).to have_text("Sign out")
  end

  it "can signout" do
    visit root_path
    click_link "Sign in with Github"

    click_link "Sign out"

    expect(page).to have_text("Sign in with Github")
  end
end
