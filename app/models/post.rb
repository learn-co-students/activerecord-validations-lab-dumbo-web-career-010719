class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250}
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :clickbait?

    private 
    def clickbait?
         if !title.nil? && (title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top[number]") || title.include?("Guess"))
         else
            errors.add(:title, "not clickable")
         end
    end
end
