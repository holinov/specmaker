class Group < ApplicationRecord
  has_one :group
  has_many :entry_infos

  before_save do
    self.full_path = rec_render(self)
  end

  def render
    full_path
  end

  def self.selectable
    Group.all.map { |g| { value: g.id, label: g.render } }.sort_by { :label }
  end

  def to_s
    full_path
  end

  private

  def rec_render(g)
    cur = g
    res = g.name
    if g.group_id
      unless cur.group.present?
        cur = Group.find(cur.group_id)
        res = "#{cur.name} / #{res}"
      end
    end
    res
  end
end
