class Feed < ApplicationRecord
  has_many :entries, dependent: :destroy
  belongs_to :user
  
  validates :name, :url, :user, presence: true
  validates :url, uniqueness: { scope: :user, case_sensitive: false }
  validate :url_not_changed
  
  after_save :log_subscribed_feeds
 
  private
    def log_subscribed_feeds
      CreateFeedEntriesJob.delay.perform_now
    end
    
    def url_not_changed
      if url_changed? && self.persisted?
        errors.add(:url, "Change of url not allowed!")
      end
    end
end
