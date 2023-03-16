class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in:["Fiction", "Non-Fiction"]}
    validate :title_is_clickbait

  def title_is_clickbait
    if title.present? && !title.include?("Won't Believe" || "Secret" || "Top" || "Guess")
      errors.add(:title, "must be clickbait-y!")
    end
end
end
