class Product < ApplicationRecord
  has_many :orders, dependent: :destroy
  validates :title, :cost, presence: true
end
