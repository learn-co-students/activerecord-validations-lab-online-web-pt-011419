class Post < ActiveRecord::Base
  validates :title, presence: true 
  validates :content, length:{minimum: 250}
  validates :summary, length:{maximum: 250}
  validates :category, inclusion:{in:%w(Fiction Non-Fiction)}
  validates :clickbait?
  
  clickbait = ["Won't Believe", "Secret", "Top[number", "Guess"]
  
  def clickbait?
    if clickbait.none? {|param| param.title}
      binding.pry 
    else 
      clickbait.errors.messages "Clickbait"
    end 
  end 
end
