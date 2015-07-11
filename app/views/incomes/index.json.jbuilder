json.array!(@incomes) do |income|
  json.extract! income, :id, :date_of_income, :amount
  json.url income_url(income, format: :json)
end
