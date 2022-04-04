class CreateIntros < ActiveRecord::Migration[7.0]
  def change
    create_table :intros do |t|

      t.timestamps
    end
  end
end
