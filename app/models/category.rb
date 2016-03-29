class Category < ActiveRecord::Base
	default_scope { order(created_at: :desc) }
	has_many :articles, :dependent=>:destroy
	has_many :sub_categories, class_name: 'Category', foreign_key: :parent_id
  	belongs_to :parent, class_name: 'Category'
end
