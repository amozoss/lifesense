class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.references :tag, index: true

      t.timestamps
    end

    create_table :tags do |t|
      t.string :name
      t.timestamps
    end

  end
end
