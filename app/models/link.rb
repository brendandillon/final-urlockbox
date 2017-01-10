class Link < ApplicationRecord
  validates :url, url: true
  validates :title, presence: true
end
