class Article < ActiveRecord::Base
  attr_accessible :autor, :content, :resume, :title, :published_at
  
  #validações
  validates :title, :presence => true
  validates :autor, :presence => true
  validates :content, :presence => true
  validates :resume, :presence => true
  
  #associações
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :comments
  
  #scopes
  scope :published, where("articles.published_at IS NOT NULL")
  scope :draft, where("articles.published_at IS NULL")
  scope :recent, lambda { published.where("articles.published_at > ?", 1.week.ago.to_date)}
  scope :where_title, lambda { |term| where("articles.title LIKE ?", "%#{term}%")}
  
  #definições de métodos
  def published?
	published_at.present?
  end

  def owned_by?(owner)
    return false unless owner.is_a? User
    user == owner
  end
  
  def comment_fathers(article_id)
  	Comment.find_all_by_article_id_and_father_comment_id(article_id, nil)
  end
end