require 'rails_helper'

RSpec.describe Image, type: :model do
  context 'Validation' do
    it { should validate_presence_of :article }
    it { should validate_presence_of :headline }
  end

  context 'Association' do
    it { should belong_to :article }
  end

  context 'Check' do
    let!(:article) { create(:article) }
    let!(:image1) { create(:image, ordering: 3, article_id: article.id) }
    let!(:image2) { create(:image, ordering: 1, article_id: article.id) }
    let!(:image3) { create(:image, ordering: 2, article_id: article.id) }

    it 'Ordering' do
      expect(article.images.first.ordering).to eq image2.ordering
      expect(article.images.second.ordering).to eq image3.ordering
      expect(article.images.last.ordering).to eq image1.ordering
    end

    it 'Increment like' do
      before_increment_like = image1.like
      image1.increment_like
      
      expect(image1.like).to eq (before_increment_like + 1)
    end
  end
end
