class AddCreatedByToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :created_by, :string
  end
end
