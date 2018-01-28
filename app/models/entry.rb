class Entry < ApplicationRecord
  validates :url, presence: true
  
  belongs_to :feed
end
