require 'spec_helper'

class LocalizableModel < Cms::Models::Document
  include Localize
  field :name, type: String
  field :title, type: String
  field :label, type: String
  
  localize_fields :title, :label
end

describe Localize do
  let(:localizable_model) { LocalizableModel.create title: "title", name: 'name', label: 'label'}
  
  it "title should be localize" do
    expect(localizable_model.fields_localized).to include(:title)
  end
  
  it "label should be localize" do
    expect(localizable_model.fields_localized).to include(:label)
  end
  
  it "name should not be localize" do
    expect(localizable_model.fields_localized).not_to include(:name)
  end
  
end
