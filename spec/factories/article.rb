FactoryGirl.define do
  factory :article do
    sequence(:title) { |n| "Title #{n}" }
    posted_at { Time.zone.now }
  end
end
