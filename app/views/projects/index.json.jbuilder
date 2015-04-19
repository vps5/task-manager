json.array!(@projects) do |project|
  json.extract! project, :id, :description, :active, :completed, :soft_deadline, :hard_deadline
  json.url project_url(project, format: :json)
end
