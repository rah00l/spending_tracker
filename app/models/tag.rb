class Tag < ActiveRecord::Base

  ############################# Scema Information ##############################################################
  # 	Column 			Type 			Collation 		Null 	Default 	Extra
  # 1 	id 			int(11) 						No 		None 	AUTO_INCREMENT
  # 2 	name 		varchar(255) 	utf8_unicode_ci Yes 	NULL
  # 3 	description text 			utf8_unicode_ci Yes 	NULL
  # 4 	created_at 	datetime 						No 		None
  # 5 	updated_at 	datetime 						No 		None
  ############################# Scema Information ##############################################################

  # Validation
  validates :name, presence: true, uniqueness: true

  # define association macro's
  has_many :taggings, dependent: :destroy
  has_many :incomes, through: :taggings, source: :taggable, source_type: "Income"

  has_many :expenses, through: :taggings, source: :taggable, source_type: "Expense"

end
