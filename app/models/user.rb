require 'digest'
class User < ActiveRecord::Base
	
  #incluir gem gravtastic
  include Gravtastic
	
  gravtastic

  attr_accessible :born, :email, :name, :lastname, :nickname, :password, :password_confirmation, :profile_id
  
  attr_accessor :password
  
  #validações
  validates :born, :presence => true
  validates :email, :uniqueness => true, 
                    :length => { :within => 5..50 },
                    :format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i },
                    :presence => true
  validates :name, :presence => true
  validates :lastname, :presence => true
  validates :nickname, 	:presence => true
  validates :password, 	:confirmation => true,
						:length => { :within => 4..20 },
						:presence => true,
						:if => :password_required?
  
  #associações
  belongs_to :profile
  has_many :articles, :order => 'published_at DESC', :dependent => :nullify
  has_many :replies, :through => :articles , :source => :comments
  has_many :comments  
  
  before_save :encrypt_new_password
  
  def self.authenticate(nickname, password)
	user = find_by_nickname(nickname)
	return user if user && user.authenticated?(password)
  end
  
  def authenticated?(password)
	self.hashed_password == encrypt(password)
  end

  protected
  def encrypt_new_password
	return if password.blank?
	self.hashed_password = encrypt(password)
  end
  
  def password_required?
	hashed_password.blank? || password.present?
  end
  
  def encrypt(string)
	Digest::SHA1.hexdigest(string)
  end
end