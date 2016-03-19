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

  scope :filter_option, -> (key, value) {
                              where("transacts.#{key} = ?", value)
                            }
  scope :range_filter, ->(key, value_1, value_2) {
                            where(:"transacts.#{key}" => value_1..value_2)
                          }

  def self.filtered_result(options)
    # options['sort'] = 'file_details.updated_at' if options['sort'].blank?
    # options['direction'] = 'DESC' if options['direction'].blank?

    result = includes(transactable: :category)
              .filter_data(options)
              # .order("#{options['sort']} #{options['direction']}")

    # result = result.unique_file_details if options['unique_file_details'].present?
    result
  end

  def self.filter_data(options)
    result = self
    column_names.each do |name|
        if options[name].present? && %w(updated_at).exclude?(name)
        result = result.filter_option(name, options[name])
      end
    end

    result = result.range_filter('created_at', options[:from], options[:to])
    # result = result.page_count(prepare_page_count(options)) if options['page_count'].present?

    result
  end

end
