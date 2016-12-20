class AddTitleToAudios < ActiveRecord::Migration[5.0]
  def change
    add_column :audios, :title, :string
  end
end
