json.array!(@qoutes) do |qoute|
  json.extract! qoute, :id, :message, :user_id, :qoute_by
  json.url qoute_url(qoute, format: :json)
end
