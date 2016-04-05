class Article < ActiveRecord::Base
	default_scope { order(created_at: :desc) }
	belongs_to :category
	has_many :comments, :dependent => :destroy
end
