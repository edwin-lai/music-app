class Track < ActiveRecord::Base
  validates :name, presence: true
  validates :regular_or_bonus, presence: :true, inclusion: %w(bonus regular)

  belongs_to :album
end
