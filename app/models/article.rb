class Article < ActiveRecord::Base
  has_many :images
  has_many :texts

  validates :title, 
            :posted_at,
            presence: true

  def posted_at?
    posted_at < Time.zone.now
  end

  def increment_like
    self.like += 1
    self.save
  end
end
