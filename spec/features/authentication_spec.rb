require "rails_helper"

RSpec.describe "Authentication flow", type: :feature do
  before do
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:github, omni_auth)
    VCR.turn_off!
    WebMock.allow_net_connect!
  end

  after do
    VCR.turn_on!
  end

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

  def omni_auth
    { "provider" => "github",
      "uid" => "12345",
      "info" => {
        "name" => "jimmy",
        "nickname" => "skuhlmann",
        "email" => "jimmy@example.com",
        "image" => "https://avatars2.githubusercontent.com/u/6923345?v=3&s=460"
      }
    }
  end
end
