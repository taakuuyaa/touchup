class VideoItemLink < ApplicationRecord
  belongs_to :video

  validate :both_inputs?

  private

  def both_inputs?
    unless name.present? && url.present?
      errors.add(:name, '関連アイテムリンクは両方入力してください')
    end
  end
end
