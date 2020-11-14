class User < ApplicationRecord
  has_many :boards, dependent: :destroy
  has_many :comments, dependent: :destroy
  authenticates_with_sorcery!
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, uniqueness: true, presence: true
  validates :first_name, :last_name, presence: true
  validates :first_name, :last_name, length: { maximum: 255 }

  def own?(object)
    id == object.user_id
  end
end
