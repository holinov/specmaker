json.extract! work_info, :id, :name, :amount, :units, :price, :entry_info_id, :created_at, :updated_at
json.url work_info_url(work_info, format: :json)
