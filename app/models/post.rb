# Created from the command line:
# rails g model Post title:string body:text
#
# Not only does this generate this model,
# it also generated a migration in the db/migrate
# folder. And we ran 'rake db:migrate' from
# the command prompt to created the associated
# posts table.
class Post < ActiveRecord::Base
  attr_accessible  :title, :body
  validates :title, :presence => true
  # validates_presence_of :title
end
