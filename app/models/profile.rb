class Profile < ActiveRecord::Base
  attr_accessible :name, :user_id
  
  #validações
  
  
  belongs_to :user
end
