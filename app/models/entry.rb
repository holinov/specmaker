class Entry < ApplicationRecord
  belongs_to :project
  belongs_to :entry_info

  def render
    entry_info.render
  end
end
