class Video < ApplicationRecord
  with_options presence: true do
    validates :item_url, uniqueness: true
    validates :file
    validates :capacity
  end

  mount_uploader :file, VideoUploader

  enum status: {published: 0, closed: 1, deleted: 2}

  def self.get_all_capacity
    Video.all.sum(:capacity) / 1.gigabyte
  end

  def save_video_items(request_video_items)
    true
    # return true if request_video_items.blank?
    #
    # self.video_items.delete_all
    # request_video_items.all? { |vi| self.video_items.create(video_id: self.id, item_text: vi.item_text, item_url: vi.item_url) }
  end
end
