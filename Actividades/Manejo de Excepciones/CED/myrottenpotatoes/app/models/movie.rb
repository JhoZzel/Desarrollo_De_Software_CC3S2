class Movie < ApplicationRecord
  validates :title, presence: true
  validates :rating, inclusion: { in: %w(G PG PG-13 R) }

  def self.find_movie(id)
    begin
      find(id)
    rescue ActiveRecord::RecordNotFound
      raise ApplicationRecord::ValidationError, "Movie not found with ID: #{id}"
    end
  end
end

