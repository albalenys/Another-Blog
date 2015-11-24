class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  before_save :capitalize_name

  def capitalize_name
    self.username.capitalize!
  end
end
