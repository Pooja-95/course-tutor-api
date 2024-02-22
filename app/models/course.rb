class Course < ApplicationRecord
  has_many :tutors, dependent: :destroy
  accepts_nested_attributes_for :tutors

  validates :name, presence: true, length: { maximum: 255 }, uniqueness: true
end
