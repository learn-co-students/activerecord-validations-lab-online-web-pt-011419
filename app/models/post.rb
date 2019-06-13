class Post < ActiveRecord::Base

    validates :title, presence:true 
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :clickbait?

    def clickbait?
      
        # if none conditions are met trigger error
        if title != nil && !title.include?("Won't Believe") && !title.include?("Secret") && !title.include?("Top") && !title.include?("Guess")
            errors.add(:title, "Does not contain clickbait")
        end
    end

end
