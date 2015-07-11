class Tagging < ActiveRecord::Base

############################# Scema Information ##############################################################
	# # 	Column 						Type 							Collation 			Null 		Default 		Extra
	# 	1 	id 								int(11) 													No 		None 				AUTO_INCREMENT
	# 	2 	taggable_id 			int(11) 													Yes 	NULL
	# 	3 	taggable_type 		varchar(255)		utf8_unicode_ci 	Yes 	NULL
	# 	4 	tag_id 						int(11) 													Yes 	NULL
	# 	5 	created_at 				datetime 													No 		None
	# 	6 	updated_at 				datetime 													No 		None
############################# Scema Information ##############################################################

# define association macro's
	belongs_to :tag
	belongs_to :taggable, :polymorphic => true

end
