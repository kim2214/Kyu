class AddContentsToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :contents, :string
  end
end
