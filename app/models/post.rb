class Post < ActiveRecord::Base
   validates :title, presence: true
   validates :content, length: { minimum: 250}
   validates :summary, length: {maximum: 250}
   validates :category, inclusion: %w(Fiction Non-Fiction)
   validate :title_is_clickbaity


def title_is_clickbaity
   if !title.nil? && (!title.include?("Won't Believe" || "Secret" || "Top [/\d+/]" || "Guess"))
     errors.add(:title_is_clickbaity, "Try again! Title does not meet clickbait-y standards!")
   end
 end
 end
