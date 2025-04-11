# frozen_string_literal: true

class Evdatum < ApplicationRecord
  belongs_to :entity, polymorphic: true
end
