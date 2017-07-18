class EntryInfoSerializer < ActiveModel::Serializer
  attributes :id, :name, :group_id, :group_name, :full_name, :fields, :created_at, :updated_at

  def group_name
    object.group.render
  end

  def full_name
    object.render
  end

  has_many :fields
end
