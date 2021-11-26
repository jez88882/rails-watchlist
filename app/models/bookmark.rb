class Bookmark < ApplicationRecord

  # before_validation :unique_pairings
  validates :comment, presence: true, length: {minimum: 6}
  validates :movie, presence: true
  validates :list, presence: true, uniqueness: {scope: :movie}


  belongs_to :movie
  belongs_to :list

  private

  # def unique_pairings
  #   unless Mov
  # end
end
