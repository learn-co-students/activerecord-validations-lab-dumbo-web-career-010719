class ClickbaitValidator < ActiveModel::EachValidator
  def validate_each(record, attr, val)
    # binding.pry
    if !val.nil? && !(["Won't Believe", "Secret", "Top[number]", "Guess"].any?{|p| record.title.include?(p)})
      record.errors.add(attr, "Not clickbait.")
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true, clickbait: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
end
