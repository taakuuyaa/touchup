class VideoCapacity < ApplicationRecord
  belongs_to :video

  def self.get_monthly_capacity
    now = Time.zone.now

    target_month = Range.new(
        now.beginning_of_month,
        now.end_of_month
    )

    VideoCapacity.where(created_at: target_month).sum(:capacity) / 1.gigabyte
  end
end
