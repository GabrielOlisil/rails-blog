class Tag < ApplicationRecord
  has_many :posts

  attribute :descryption
end
