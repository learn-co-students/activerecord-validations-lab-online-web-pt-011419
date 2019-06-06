class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction or Non-Fiction)}
  validate :clickbait?

     def clickbait?
      if ["Won't Believe", "Secret", "Top", "Guess"].none? {|phrase| self.title.include?(phrase) if self.title}
        errors.add(:title, "This is not clickbait")
      end
    end
end 
