json.array!(@subjects) do |subject|
  json.extract! subject, :id, :name, :description, :author
  json.url subject_url(subject, format: :json)
end
