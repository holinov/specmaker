class FieldSerializer < ActiveModel::Serializer
  attributes :id, :field_info_id, :field_name, :value, :field_units, :created_at, :updated_at

  def field_name
    object.field_info.name
  end

  def field_units
    object.field_info.unit_name
  end

  def sort_order
    object.field_info.sort_order
  end
end
