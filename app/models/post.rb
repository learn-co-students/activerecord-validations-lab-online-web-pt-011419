class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait

private

  def clickbait
    if self.title && !self.title.match(/Won't Believe|Secret|Top [\d*]|Guess/)
      errors.add(:clickbait, "Title is not clickbait-y.")
    end
  end
end
