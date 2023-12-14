class User < ApplicationRecord
  has_many :reviews, -> { order(id: :desc) }
end
