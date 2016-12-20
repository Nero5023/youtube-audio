class CreateAudios < ActiveRecord::Migration[5.0]
  def change
    create_table :audios do |t|
      t.string :filename
      t.string :url

      t.timestamps
    end
  end
end
