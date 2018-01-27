class Feed < ApplicationRecord
  validates :name, :url, presence: true
  validates :url, uniqueness: { case_sensitive: false }
  
  has_many :entries, dependent: :destroy
  belongs_to :user
end
