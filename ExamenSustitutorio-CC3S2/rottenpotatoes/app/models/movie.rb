class Movie < ActiveRecord::Base

  #### Part 1 ####
  # implement this method. Remeber to exclude [self]
  # (the current movie) from your return value

  validates :director, presence: true

  def name_with_rating
    return "#{title} (#{rating})"
  end

  def others_by_same_director
    # Your code here #
  end
end
