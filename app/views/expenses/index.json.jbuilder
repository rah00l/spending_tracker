json.array!(@expenses) do |expense|
  json.extract! expense, :id, :date_of_expense, :amount, :account_id
  json.url expense_url(expense, format: :json)
end
