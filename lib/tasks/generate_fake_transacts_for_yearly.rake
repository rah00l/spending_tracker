## For run rake task
## rake prep:db:seed:transacts:yearly:fakes

namespace :prep do
  namespace :db do
    namespace :seed do
      namespace :transacts do
        namespace :yearly do
          desc "Setup the few 'Fake' transacts entries"
          task fakes: ["db:seed"] do
            begin

              # Clear out any existing records from incomes
              Income.destroy_all

              # Clear out any existing records from expenses
              Expense.destroy_all

              # Clear out any existing records from transacts
              Transact.destroy_all

              # For generating data for whole year
              upto_limit = Date.today.month

              1.upto(upto_limit) do |month|
                
                puts "------------------ Data generating for month #{month} ----------------------"
                
                max_income = 1
                puts "Generating #{max_income} fake incomes ..."

                date_for_income = (Date.new(Date.today.year, month))

                Income.create(date_of_income: date_for_income,
                              created_at: date_for_income,
                              amount: 78000.0, account_id: get_ideal_account.id,
                              category_id: get_ideal_income_category.id,
                              note: "Heyyy salary has been credited....!")


                puts "Created fake inocmes #{max_income}."

                max_expenses = rand(10) + 1
                puts "Generating #{max_expenses} fake expenses ..."
                max_expenses.times do
                  category = pick_random_category
                  
                  fake_date = generate_fake_date(month)
                  puts fake_date
                  Expense.create(date_of_expense: fake_date,
                                 created_at: fake_date,
                                 amount: rand(200..15000).to_f, account_id: get_ideal_account.id,
                                 category_id: category.id,
                                 note: "Created expense entry against #{category.name} category.")
                end
                puts "Generated #{max_expenses} fake expenses ..."
              end

            rescue => error
              puts error.inspect
            end # end of begin
          end # end of task fakes
        end # end of namespace :yearly
      end # end of namespace :transacts
    end # end of namespace :seed
  end # end of namespace :db
end # end of namespace :prep

# Supportive functions for generating fake data
def generate_fake_date(month)
  return time_rand Time.local(Date.today.year, month, 3),Time.local(Date.today.year, month, Date.today.end_of_month.day)
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
