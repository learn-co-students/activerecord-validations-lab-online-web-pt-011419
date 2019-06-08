class Post < ActiveRecord::Base
  validates :title, presence: true 
  validates :content, length:{minimum: 250}
  validates :summary, length:{maximum: 250}
  validates :category, inclusion:{in:%w(Fiction Non-Fiction)}
  validate :clickbait?
  
  clickbait = ["Won't Believe", "Secret", "Top[number", "Guess"]
  
  def clickbait?
    if clickbait.none? {|param| param.title}
      binding.pry 
    else 
      
    end 
  end 
end
