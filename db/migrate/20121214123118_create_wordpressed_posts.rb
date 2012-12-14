class CreateWordpressedPosts < ActiveRecord::Migration
  def change
    create_table :wordpressed_posts do |t|
      t.integer :wp_id
      t.string :title
      t.string :wp_url
      t.text :content
      t.text :excerpt
      t.string :slug
      t.string :status

      t.timestamps
    end
  end
end
