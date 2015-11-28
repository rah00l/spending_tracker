class Qoute < ActiveRecord::Base

############################# Scema Information ##############################################################
	# 	#	Name		Type		Collation		Attributes	Null			Default	Extra
	# 	1	id			int(11)							No		None			AUTO_INCREMENT	
	# 	2	message		text		utf8_unicode_ci		Yes		NULL		
	# 	3	user_id		int(11)							Yes		NULL		
	# 	4	qoute_by	varchar(255) utf8_unicode_ci	Yes		NULL		
	# 	5	created_at	datetime						No		None		
	# 	6	updated_at	datetime						No		None		
############################# Scema Information ##############################################################
	
	# Validation
	validates :message,:qoute_by, presence: true

	# defination of association macro's
	belongs_to :user

	# callbacks
	cattr_accessor :current_user
	after_create :assign_user

	private

	def assign_user
		self.update_attributes(:user_id => current_user.id) unless current_user.nil?
	end
end
