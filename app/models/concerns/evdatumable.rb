module Evdatumable
  extend ActiveSupport::Concern

  EAttribute = Data.define(:name, :column_name, :type, :default, :options, :required, :value)

  included do
    has_one :evdatum, as: :entity, dependent: :destroy

    def evdata
      evdatum&.data || {}
    end

    def evdata=(data)
      evdatum&.update(data: data) || create_evdatum(data: data)
    end

    def evatributes
      def evatributes
        Evatribute.where(entity_type: self.name).map do |attribute|
          EAttribute.new(
            name: attribute.name,
            column_name: attribute.column_name,
            type: attribute.data_type,
            default: attribute&.default,
            options: attribute&.options,
            required: attribute&.required,
            value: nil# evdata[attribute.column_name]
          )
        end
      end
    end
  end

  # class_methods do
  # end
end
