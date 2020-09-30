class ChangeArticleColumnNames < ActiveRecord::Migration[5.2]
  def up
    remove_column :articles, :subtitle
    add_column :articles, :text_content, :jsonb
  end

  def down
    add_column :articles, :subtitle, :string
    remove_column :articles, :text_content, :jsonb
  end
end
