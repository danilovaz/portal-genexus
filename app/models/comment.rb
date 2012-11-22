class Comment < ActiveRecord::Base
  attr_accessible :article_id, :user_id, :body, :father_comment_id
  
  #associa��es
  belongs_to :article
  belongs_to :user

  
  #valida��es
  validates :article_id, :user_id, :body, :presence => true
  validate :article_should_be_published
  
  def article_should_be_published
  
	errors.add(:article_id, "Esse artigo ainda n�o foi publicado") if article && !article.published?
  
  end
end