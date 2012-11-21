class Profile < ActiveRecord::Base
  attr_accessible :name
  
  #validações
  
  
  has_many :user
end
