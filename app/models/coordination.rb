class Coordination < ApplicationRecord
    belongs_to :user
    attachment :image

    with_options presence: true do
        validates :image
        validates :body
      end
end
