class AddAwesomenessToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :awesomeness, :string

  end
end
