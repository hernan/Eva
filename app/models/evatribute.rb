# frozen_string_literal: true

class Evatribute < ApplicationRecord
  DATA_TYPES = %w[string integer datetime list]
  ENTITIES = %w[Product User Order]

  validates :name, presence: true, uniqueness: { scope: :entity_type }
  validates :column_name, presence: true, uniqueness: { scope: :entity_type }
  validates :data_type, presence: true, inclusion: { in: DATA_TYPES }
  validates :entity_type, presence: true, inclusion: { in: ENTITIES }

  before_validation :set_column_name

  def set_column_name
    self.column_name ||= name.parameterize(separator: "_")
  end
end
