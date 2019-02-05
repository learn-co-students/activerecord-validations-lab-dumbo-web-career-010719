class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: {minimum: 10}
    validates :summary, length: { maximum: 20 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not listed" }
  
  validate :is_clickbait?

  CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def is_clickbait?
  	clickbait = [/Won't Believe/, /Secret/, /Top [number]/, /Guess/]

    if clickbait.none? { |pattern| pattern.match title }
      errors.add(:title, "must be clickbait")
    end
  end
end
