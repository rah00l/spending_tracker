## For run rake task
## rake prep:db:seed:transacts:fakes

namespace :prep do
  namespace :db do
    namespace :seed do
      namespace :transacts do
        desc "Setup the few 'Fake' transacts entries for current month"
          task fakes: ["db:seed"] do
          begin

            # Clear out any existing records from incomes
            Income.destroy_all

            # Clear out any existing records from expenses
            Expense.destroy_all

            # Clear out any existing records from transacts
            Transact.destroy_all

            max_income = 1
            puts "Generating #{max_income} fake incomes ..."

            Income.create(date_of_income: (Date.today).at_beginning_of_month,
                          created_at: (Date.today).at_beginning_of_month,
                          amount: 78000.0, account_id: get_ideal_account.id,
                          category_id: get_ideal_income_category.id,
                          note: "Heyyy salary has been credited....!")


            puts "Created fake inocmes #{max_income}."

            max_expenses = rand(15) + 1
            puts "Generating #{max_expenses} fake expenses ..."

            max_expenses.times do
              category = pick_random_category
              Expense.create(date_of_expense: generate_fake_date,
                             created_at: generate_fake_date,
                             amount: rand(200..10000).to_f, account_id: get_ideal_account.id,
                             category_id: category.id,
                             note: "Created expense entry against #{category.name} category.")
            end

            puts "Generated #{max_expenses} fake expenses ..."
          rescue => error
            puts error.inspect
          end
        end
      end
    end
  end
end

# Supportive functions for generating fake data
def generate_fake_date
  return time_rand Time.local(Date.today.year, Date.today.month, 3)
end

def pick_random_category
  name = ["Cloths", "Eating Out", "Entertainment","Fuel","General","Gifts","Holidays","Kids","Shoppings","Sports","Travel"].sample
  return Category.find_by(name: name)
end

def get_ideal_account
  return Account.find_by(name: "Personal")
end

def get_ideal_income_category
  return Category.find_by(name: "Salary")
end

# STD function for getting random dates between provided time interval
def time_rand from = 0.0, to = Time.now
  Time.at(from + rand * (to.to_f - from.to_f))
end