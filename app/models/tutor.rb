class Tutor < ApplicationRecord
  belongs_to :course

  validates :name, presence: true, length: { maximum: 255 }
  validates :bio, presence: true
end
