class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :movie, :list, uniqueness: {scope: [:movie_id, :list_id] }
  validates :comment, length: { minimum: 6 }
end
