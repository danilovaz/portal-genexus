class Article < ActiveRecord::Base
  attr_accessible :autor, :content, :postdate, :resume, :title, :published_at
  
  #valida��es
  validates :title, :presence => true
  validates :autor, :presence => true
  validates :content, :presence => true
  validates :postdate, :presence => true
  validates :resume, :presence => true
  
  #associa��es
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :comments
  
  #scopes
  scope :published, where("articles.published_at IS NOT NULL")
  scope :draft, where("articles.published_at IS NULL")
  scope :recent, lambda { published.where("articles.published_at > ?", 1.week.ago.to_date)}
  scope :where_title, lambda { |term| where("articles.title LIKE ?", "%#{term}%")}
  
  #defini��es de m�todos
  def published?
	published_at.present?
  end

  def owned_by?(owner)
    return false unless owner.is_a? User
    user == owner
  end
end