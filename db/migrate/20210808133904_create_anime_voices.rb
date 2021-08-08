class CreateAnimeVoices < ActiveRecord::Migration[5.2]
  def change
    create_table :anime_voices do |t|
      t.integer :voice_id
      t.integer :anime_id

      t.timestamps
    end
  end
end
