class Restaurant < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :rating, inclusion: { in: 1..5 }
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
end
