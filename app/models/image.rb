class Image < ActiveRecord::Base
  default_scope { order(ordering: :asc) }

  belongs_to :article

  VALIDATE_SIZE = { in: 0..2.megabytes, message: 'Photo size too large. Please   to 2 mbs.' }
  has_attached_file :image, styles: {thumb: ['100x100'], medium: ['300x300'], large: ['800x800']},
                            :processor => "mini_magick",
                            :default_url => "/images/users/picture/thumb/missing.png"
  validates_attachment  :image,
                        content_type: {content_type: /\Aimage\/.*\Z/},
                        size: VALIDATE_SIZE

  validates :article, 
            :headline,
            presence: true

  def increment_like
    self.like += 1
    self.save
  end
end
