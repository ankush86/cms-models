module Localize
  extend ActiveSupport::Concern

  included do
    def fields_localized
      self.class.fields_localized
    end

  end

  class_methods do
    #def fields_localize
      #localize_fields fields_to_localize
    #end

    #def fields_to_localize
      #[:title, :summary, :content, :caption, :label, :description]
    #end

    def localized_field name
      return unless has_field? name
      field name, type: String, localize: true
      fields_localized << name
    end

    def localize_fields *names
      names.each {|name| localized_field name}
    end

    def fields_localized
      @fields_localized ||= []
    end
  end
end
