class Video < ApplicationRecord
  has_one :video_capacity
  has_many :video_item_links, dependent: :destroy
  accepts_nested_attributes_for :video_item_links, allow_destroy: true

  validates_associated :video_item_links

  with_options presence: true do
    validates :item_url, uniqueness: true
    validates :file
  end

  mount_uploader :file, VideoUploader

  enum status: {published: 0, closed: 1}
end
