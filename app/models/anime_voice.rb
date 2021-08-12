class AnimeVoice < ApplicationRecord
  belongs_to :anime
  belongs_to :voice
end
