class Profile < ActiveRecord::Base
  attr_accessible :name, :user_id
  
  #valida��es
  
  
  belongs_to :user
end
