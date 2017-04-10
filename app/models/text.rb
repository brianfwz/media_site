class Text < ActiveRecord::Base
  default_scope { order(ordering: :asc) }

  belongs_to :article

  validates :article, 
            :headline,
            :sentence,
            presence: true

  def increment_like
    self.like += 1
    self.save
  end
end
