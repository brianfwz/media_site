FactoryGirl.define do
  factory :text do
    sequence(:headline) { |n| "Headline #{n}" }
    sequence(:sentence) { |n| "Sentence #{n}" }
    article_id { create(:article) }
  end
end
