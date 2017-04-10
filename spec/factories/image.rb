FactoryGirl.define do
  factory :image do
    sequence(:headline) { |n| "Headline #{n}" }
    image { File.new("#{Rails.root}/spec/fixtures/test-small.png") }
    article_id { create(:article) }
  end
end
