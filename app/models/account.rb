class Account < ActiveRecord::Base

  ############################# Scema Information ##############################################################
  # #	Column				Type			Collation				Null	Default	Extra	
  # 1	id					int(11)									No		None	AUTO_INCREMENT
  # 2	name				varchar(255)		utf8_unicode_ci		No		None		 
  # 3	description			text				utf8_unicode_ci		Yes		NULL		 
  # 4	status				tinyint(1)								Yes		1		 
  # 5	created_at			datetime								No		None
  # 6	updated_at			datetime								No		None
  ############################# Scema Information ##############################################################


  # defination of association macro's
  has_many :incomes, dependent: :destroy
  has_many :expenses, dependent: :destroy


  # Validation
  validates :name, presence: true, uniqueness: true
end
