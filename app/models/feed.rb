class Feed < ApplicationRecord
  has_many :entries, dependent: :destroy
  belongs_to :user
  
  validates :name, :url, :user, presence: true
  validates :url, uniqueness: { scope: :user, case_sensitive: false }
end
