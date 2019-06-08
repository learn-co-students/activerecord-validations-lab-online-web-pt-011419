class Post < ActiveRecord::Base
  validates :title, presence: true 
  validates :content, length:{minimum: 250}
  validates :summary, length:{maximum: 250}
  validates :category, inclusion:{in:%w(Fiction Non-Fiction)}
  validate :clickbait?
  
  CLICKBAIT = [/Won't Believe/, /Secret/, /Top[0-9]/, /Guess/]
  
  def clickbait?
    if CLICKBAIT.none? {|word| word.match(title)}
      errors.add(:title, "Errors")
    end 
  end 
end
