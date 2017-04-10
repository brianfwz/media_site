require 'rails_helper'

RSpec.describe Text, type: :model do
  context 'Validation' do
    it { should validate_presence_of :article }
    it { should validate_presence_of :headline }
    it { should validate_presence_of :sentence }
  end

  context 'Association' do
    it { should belong_to :article }
  end

  context 'Check' do
    let!(:article) { create(:article) }
    let!(:text1) { create(:text, ordering: 3, article_id: article.id) }
    let!(:text2) { create(:text, ordering: 1, article_id: article.id) }
    let!(:text3) { create(:text, ordering: 2, article_id: article.id) }

    it 'Ordering' do
      expect(article.texts.first.ordering).to eq text2.ordering
      expect(article.texts.second.ordering).to eq text3.ordering
      expect(article.texts.last.ordering).to eq text1.ordering
    end

    it 'Increment like' do
      before_increment_like = text1.like
      text1.increment_like
      
      expect(text1.like).to eq (before_increment_like + 1)
    end
  end
end
