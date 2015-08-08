class Transact < ActiveRecord::Base
	############################# Scema Information ##############################################################
	#	Column				Type			Collation	Attributes		Null			Default	Extra	
	# 1	id					int(11)							No			None			AUTO_INCREMENT	 
	# 2	transactable_id		int(11)							Yes			NULL		 
	# 3	transactable_type	varchar(255)	utf8_unicode_ci	Yes			NULL		 
	# 4	amount				float							Yes			NULL		 
	# 5	created_at			datetime						No			None		 
	# 6	updated_at			datetime						No			None
	############################# Scema Information ##############################################################

  # defination of association macro's
	belongs_to :transactable, polymorphic: true 

	default_scope { order(updated_at: :desc) }

	scope :collective_income, -> { where("transactable_type=? and created_at>= ? and created_at<=?",'Income',Time.zone.now.beginning_of_month,Time.zone.now.end_of_month).sum(:amount) } 

	scope :collective_expense, -> { where("transactable_type=? and created_at>= ? and created_at<=?",'Expense',Time.zone.now.beginning_of_month,Time.zone.now.end_of_month).sum(:amount) } 

	# def collective_income
		
	# end

end
