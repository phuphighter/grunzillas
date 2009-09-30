class Comment < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :comment
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  
  cattr_reader :per_page
  @@per_page = 15
end
