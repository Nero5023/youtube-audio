class AddThumbnailUrlToAudios < ActiveRecord::Migration[5.0]
  def change
    add_column :audios, :thumbnail_url, :string
  end
end
