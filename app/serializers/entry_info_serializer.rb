class EntryInfoSerializer < ActiveModel::Serializer
  attributes :id, :name, :group_id, :group_name, :full_name, :fields, :created_at\
      , :updated_at, :feilds_text

  def group_name
    object&.group&.render
  end

  def full_name
    object&.render
  end

  def feilds_text
    object&.render_fields
  end

  has_many :fields
end
