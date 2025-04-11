# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, presence: true
  validates :sku, presence: true, format: { with: /\A[a-zA-Z0-9-]+\z/ }, length: { maximum: 20 }, uniqueness: true

  normalizes :sku, with: ->(sku) { sku.upcase }

  has_one :evdatum, as: :entity, dependent: :destroy

  scope :evatributes, -> { Evatribute.where(entity_type: "Product") }
end
