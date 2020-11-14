class Board < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65_535 }
  # validates :board_image, format: { with: .+\.(jpeg|jpeg|png|gif) }
  mount_uploader :board_image, BoardImageUploader
end
