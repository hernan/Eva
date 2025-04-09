class Product < ApplicationRecord
  validates :name, presence: true
  validates :sku, presence: true, format: { with: /\A[a-zA-Z0-9-]+\z/ }, length: { maximum: 20 }, uniqueness: true

  normalizes :sku, with: ->(sku) { sku.upcase }
end
