# == Schema Information
#
# Table name: movies
#
#  id          :bigint(8)        not null, primary key
#  description :string(255)
#  title       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Movie < ApplicationRecord
    has_many :reviews
end
