class AddDurationToAudios < ActiveRecord::Migration[5.0]
  def change
    add_column :audios, :duration, :int
  end
end
