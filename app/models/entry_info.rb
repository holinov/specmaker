class EntryInfo < ApplicationRecord
  belongs_to :group
  has_many :fields
  has_many :field_infos, through: :fields

  def render
    # TODO: сделать нормальный запрос с джойном
    "#{group.render} / #{name} " + fields.sort_by { |f| f.field_info.sort_order }
                        .map(&:render)
                        .join(' ')
  end
end
