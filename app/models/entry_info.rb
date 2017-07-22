class EntryInfo < ApplicationRecord
  belongs_to :group
  has_many :fields
  #has_many :field_infos, through: :fields
  has_many :work_infos

  def field_info_ids
    fields.joins(:field_info).map { |i| i.id }
  end

  def render
    "#{group&.render} / #{name} #{render_fields}"
  end

  def render_fields
    fields.joins(:field_info).order('field_infos.sort_order ASC')
      .map(&:render)
      .join(' ')
  end
end
