class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :desc, :work_infos, :created_at

  def work_infos
    object.entry_infos.map(&:work_infos).flatten
  end
end
