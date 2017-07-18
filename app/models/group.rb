class Group < ApplicationRecord
  has_many :entry_infos
  attr_accessor :skipUpdate

  def group
    Group.find(group_id)
  end

  def groups
    Group.where(group_id: item.id)
  end

  before_save do
    unless skipUpdate
      self.full_path = rec_render
      update_childs(self)
    end
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

  def update_childs(item, new_root = nil)
    Group.where(group_id: item.id).find_each do |ch|
      new_path = "#{new_root ? new_root : item.full_path} / #{ch.name}"
      update_childs(ch, new_path)
      ch.update!(full_path: new_path, skipUpdate: true)
    end
  end


  def rec_render
    cur = self
    res = name
    if group_id
      while cur.group_id.present?
        cur = Group.find(cur.group_id)
        res = "#{cur.name} / #{res}"
      end
    end
    res
  end

end
