class Transact < ActiveRecord::Base
  ############################# Scema Information ##############################################################
  # Column              Type        Collation Attributes    Null      Default Extra
  # 1 id                int(11)       No                    None      AUTO_INCREMENT
  # 2 transactable_id   int(11)       Yes                   NULL
  # 3 transactable_type varchar(255)          utf8_unicode_ci Yes     NULL
  # 4 amount            float         Yes     NULL
  # 5 created_at        datetime      No      None
  # 6 updated_at        datetime      No      None
  ############################# Scema Information ##############################################################

  # defination of association macro's
  belongs_to :transactable, polymorphic: true

  belongs_to :account

  default_scope { order(created_at: :desc) }

  scope :by_account, ->(selected_account) {where('account_id IN (?)', selected_account)}
  scope :income, -> { where('transactable_type=?', 'Income') }
  scope :expense, -> { where('transactable_type=?', 'Expense') }

  scope :weekly, -> {where('created_at>= ? and created_at<=?', Date.today.beginning_of_week, Date.today.end_of_week)}
  scope :monthly, -> { where('created_at>= ? and created_at<=?', Date.today.beginning_of_month, Date.today.end_of_month) }
  scope :yearly, -> { where('created_at>= ? and created_at<=?', Date.today.beginning_of_year, Date.today.end_of_year) }

end
