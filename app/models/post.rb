class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  validates :text, :presence => true
  # accepts_nested_attributes_for :comments
end
