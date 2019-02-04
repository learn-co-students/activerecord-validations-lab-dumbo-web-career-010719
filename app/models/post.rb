class BaitValidator < ActiveModel::Validator
  def validate(record)
    unless record.title != nil and record.title.starts_with? "You Won't Believe"
      record.errors[:title] << "Needs bait"
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates_with BaitValidator
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

end
