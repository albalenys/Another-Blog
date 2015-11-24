class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  before_save :capitalize_title

  def capitalize_title
    self.title.capitalize!
  end
end
