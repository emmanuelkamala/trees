class RemoveDescriptionFromProject < ActiveRecord::Migration[7.0]
  def change
    remove_column :projects, :description, :text
  end
end
