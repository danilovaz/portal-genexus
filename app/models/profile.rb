class Profile < ActiveRecord::Base
  attr_accessible :name
  
  #valida��es
  
  
  has_many :user
end
