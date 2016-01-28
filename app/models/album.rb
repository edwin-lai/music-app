class Album < ActiveRecord::Base
  validates :name, presence: true
  validates :live_or_studio, presence: true, inclusion: %w(live studio)

  belongs_to :band
  has_many :tracks, dependent: :destroy
end
