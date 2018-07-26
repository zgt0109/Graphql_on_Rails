# == Schema Information
#
# Table name: reviews
#
#  id         :bigint(8)        not null, primary key
#  content    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  movie_id   :bigint(8)
#
# Indexes
#
#  index_reviews_on_movie_id  (movie_id)
#
# Foreign Keys
#
#  fk_rails_...  (movie_id => movies.id)
#

class Review < ApplicationRecord
  belongs_to :movie
end
