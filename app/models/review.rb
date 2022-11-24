class Review < ApplicationRecord
  belongs_to :list

  validates :rating, :content, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: (0..5) }
end
