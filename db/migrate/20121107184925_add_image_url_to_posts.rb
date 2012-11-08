# This migration was generated using this command:
#
# rails g migration add_image_to_posts image:string
class AddImageUrlToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :image, :string
  end
end
