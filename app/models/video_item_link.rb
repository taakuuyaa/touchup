class VideoItemLink < ApplicationRecord
  belongs_to :video

  validate :both_inputs?

  private

  def both_inputs?
    return if name.blank? && url.blank?

    if name.present? && url.blank?
      errors.add(:url, 'も入力してください')
    end

    if name.blank? && url.present?
      errors.add(:name, 'も入力してください')
    end
  end
end
