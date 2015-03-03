FactoryGirl.define do
  factory :user do
    name "Jim Jones"
    uid "1234567890"
    provider "github"
    twitter "@jimjones"
    email "jimjones@example.com"
    thumbnail_url "https://www.google.com/images/srpr/logo11w.png"
    nickname "jjones"
  end

  factory :goal do
    user
    title "Become a super programmer"
    description "lorem programming ipsum"
    start_date Date.current
    end_date Date.current.advance(days: 4)
    daily_quantity 6
    completed false
  end

  factory :commit do
    user
    message "Adds tests"
    date Date.yesterday
    url "https://github.com/trayo/committen_ember/pull/21"
    sha "12345678"
  end
end
