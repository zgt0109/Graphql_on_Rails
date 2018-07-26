# == Schema Information
#
# Table name: links
#
#  id          :bigint(8)        not null, primary key
#  description :text(65535)
#  url         :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint(8)
#
# Indexes
#
#  index_links_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Link < ApplicationRecord
    belongs_to :user, optional: true

    validates :url, presence: true, length: { minimum: 5 }
    validates :description, presence: true, length: { minimum: 5 }

    has_many :votes
end
