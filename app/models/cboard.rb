class Cboard < ApplicationRecord
  belongs_to :clone
  has_one_attached :photo
end
