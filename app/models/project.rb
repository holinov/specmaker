class Project < ApplicationRecord
  has_many :entries
  has_many :entry_infos, through: :entries
end
