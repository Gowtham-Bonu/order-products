class Order < ApplicationRecord
  belongs_to :product

  validates :name, :quantity,  presence: true
end
