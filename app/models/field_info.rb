class FieldInfo < ApplicationRecord
  has_many :fields
  has_many :entry_infos, through: :fields
end
