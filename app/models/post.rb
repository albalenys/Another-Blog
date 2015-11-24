class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  before_save :capitalize_title

  def capitalize_title
    self.title.capitalize!
  end

  def self.sort_by_month
    self.all.group_by { |post| post.created_at.strftime("%B") }
  end
end
