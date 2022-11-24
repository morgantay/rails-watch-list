class Movie < ApplicationRecord
  has_many :movies
  has_many :bookmarks

  validates :title, :overview, presence: true, uniqueness: true
end
