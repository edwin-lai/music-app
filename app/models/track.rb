class Track < ActiveRecord::Base
  validates :name, presence: true
  validates :regular_or_bonus, presence: :true, inclusion: %w(bonus regular)
  validates :album_id, presence: true

  belongs_to :album
end
