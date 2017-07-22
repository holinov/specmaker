class WorkInfoSerializer < ActiveModel::Serializer
  attributes :id, :name, :amount, :units, :price
end
