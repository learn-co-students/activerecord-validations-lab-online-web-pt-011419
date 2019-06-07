class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbait

    CLICKBAIT_PARAMS = [/Won't Believe/, /Secret/, /Top [0-9]*/, /Guess/]

    def clickbait
        if CLICKBAIT_PARAMS.none? { |param| param.match(title) }
            errors.add(:title, "Title not clickbait worthy")
        end
    end 
end
