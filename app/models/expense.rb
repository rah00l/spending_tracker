class Expense < ActiveRecord::Base

  ############################# Scema Information ##############################################################
  # # Column          Type  Collation Null    Default   Extra
  #    1  id          int(11)       No      None    AUTO_INCREMENT
  #    2  date_of_expense   date        Yes     NULL
  #    3  amount        float       Yes     NULL
  #    4  created_at      datetime      No      None
  #    5  updated_at      datetime      No      None
  #       account_id      int(11)       Yes NULL
  #    7 category_id      int (11)      Yes NULL
  ############################# Scema Information ##############################################################

  # Validation
  validates :amount,:category_id,:date_of_expense, presence: true

  # defination of association macro's
  belongs_to :account

  default_scope { order(date_of_expense: :desc) }

  has_one :transact, as: :transactable, dependent: :destroy

  belongs_to :category

  after_create :create_transact
  after_update :update_transact
  # after_save :harmonize_transact

  def create_transact
    Transact.create(transactable_id: id, transactable_type: "Expense", amount: amount,created_at: date_of_expense, account_id: account_id)
  end

  def update_transact
    if transact
      transact.update_attributes(transactable_id: id, transactable_type: "Expense",amount: amount,created_at: date_of_expense, account_id: account_id)
    else
      Transact.create(transactable_id: id, transactable_type: "Expense", amount: amount, created_at: date_of_expense, account_id: account_id)
    end
  end

  # defination of instance methods
  def category_name
    category.name if category
  end

  def category_name=(name)
    self.category = Category.find_or_create_by(name: name) unless name.blank?
  end
end
