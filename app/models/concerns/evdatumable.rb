module Evdatumable
  extend ActiveSupport::Concern

  included do
    has_one :evdatum, as: :entity, dependent: :destroy
    scope :evatributes, -> { Evatribute.where(entity_type: self.class.name) }

    def evdata
      evdatum&.data || {}
    end

    def evdata=(data)
      evdatum&.update(data: data) || create_evdatum(data: data)
    end

    def evatributes
      Evatribute.where(entity_type: self.class.name)
    end
  end
end
