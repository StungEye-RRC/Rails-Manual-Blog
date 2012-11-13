# Created from the command line:
# rails g model Post title:string body:text
#
# Not only does this generate this model,
# it also generated a migration in the db/migrate
# folder. And we ran 'rake db:migrate' from
# the command prompt to created the associated
# posts table.
class Post < ActiveRecord::Base
  ALLOWED_AWESOMENESS = ["Awesome", "Almost Awesome", "Not Awesome At All"]
  
  attr_accessible  :title, :body, :image, :awesomeness
  validates :title, :presence => true
  validates_inclusion_of :awesomeness, :in => ALLOWED_AWESOMENESS
  
  has_many :comments
end
