class Income < ActiveRecord::Base

  ############################# Scema Information ##############################################################
  # #	Column					Type	Collation	Null		Default		Extra	
  # 	 1	id					int(11)				No			None		AUTO_INCREMENT	 
  # 	 2	date_of_income		date				Yes			NULL		 
  # 	 3	amount				float				Yes			NULL		 
  # 	 4	created_at			datetime			No			None
  # 	 5	updated_at			datetime			No			None
  ############################# Scema Information ##############################################################

  # define association macro's
  has_many :tags, :through => :taggings
  has_many :taggings, :as => :taggable

  def tag_name
    tags.map(&:name).join(", ")
  end

  def tag_name=(name)
    self.tags.clear
    self.tags << Tag.find_or_create_by(name: name) unless name.blank?
  end

end
