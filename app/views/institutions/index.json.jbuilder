json.array!(@institutions) do |institution|
  json.extract! institution, :id, :name, :type, :length, :role, :website
  json.url institution_url(institution, format: :json)
end
