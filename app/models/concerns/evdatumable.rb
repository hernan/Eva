module Evdatumable
  extend ActiveSupport::Concern

  EAttribute = Data.define(:name, :column_name, :type, :default, :options, :required, :value)

  included do
    after_create_commit :create_evdatum
    has_one :evdatum, as: :entity, dependent: :destroy

    def evdata
      evdatum&.data || {}
    end

    def evdata=(data)
      evdatum&.update(data: data)
    end

    def evatributes
      Evatribute.where(entity_type: self.class.name).map do |attribute|
        EAttribute.new(
          name: attribute.name,
          column_name: attribute.column_name,
          type: attribute.data_type,
          default: attribute&.default,
          options: attribute&.options,
          required: attribute&.required,
          value: evdata[attribute.column_name]
        )
      end
    end

    def evattrs
      evatributes.map { |ev| [ ev.column_name.to_sym, ev.type ] }.to_h
    end
  end

  # class_methods do
  # end
end
