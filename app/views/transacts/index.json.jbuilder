json.array!(@transacts) do |transact|
  json.extract! transact, :id, :transactable_id, :transactable_type, :amount
  json.url transact_url(transact, format: :json)
end
