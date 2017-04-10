require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'Validation' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :posted_at }
  end

  context 'Association' do
    it { should have_many :images }
    it { should have_many :texts }
  end

  context 'Check' do
    let!(:article) { create(:article, posted_at: Time.zone.now - 1.days) }
    let!(:text1) { create(:text, ordering: 3, article_id: article.id) }
    let!(:text2) { create(:text, ordering: 1, article_id: article.id) }
    let!(:text3) { create(:text, ordering: 2, article_id: article.id) }
    let!(:image1) { create(:image, ordering: 3, article_id: article.id) }
    let!(:image2) { create(:image, ordering: 1, article_id: article.id) }
    let!(:image3) { create(:image, ordering: 2, article_id: article.id) }

    it 'Ordering' do
      expect(article.texts.first.ordering).to eq text2.ordering
      expect(article.texts.second.ordering).to eq text3.ordering
      expect(article.texts.last.ordering).to eq text1.ordering

      expect(article.images.first.ordering).to eq image2.ordering
      expect(article.images.second.ordering).to eq image3.ordering
      expect(article.images.last.ordering).to eq image1.ordering
    end

    it 'Increment like' do
      before_increment_like = article.like
      article.increment_like
      
      expect(article.like).to eq (before_increment_like + 1)
    end

    it 'Posted' do
      expect(article.posted_at?).to eq true

      new_article = create(:article, posted_at: Time.zone.now + 1.days)
      expect(new_article.posted_at?).to eq false
    end
  end
end
