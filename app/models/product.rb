# frozen_string_literal: true

class Product < ApplicationRecord
  include Evdatumable

  after_create_commit :create_evdatum

  validates :name, presence: true
  validates :sku, presence: true, format: { with: /\A[a-zA-Z0-9-]+\z/ }, length: { maximum: 20 }, uniqueness: true

  normalizes :sku, with: ->(sku) { sku.upcase }
end
