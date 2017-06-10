class Field < ApplicationRecord
  belongs_to :field_info
  belongs_to :entry_info

  def render
    "#{field_info.name} #{value} #{field_info.unit_name}"
  end
end
