class Avatar < ApplicationRecord
  belongs_to :user, optional: true

  has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>', default_url: '/system/missing/:style/missing.jpg' }

  validates_attachment :image, presence: true,
                       content_type: { content_type: %w(image/jpeg image/png) },
                       size: { less_than: 2.megabytes }
end
