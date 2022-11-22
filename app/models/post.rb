class Post < ApplicationRecord
    validates :title, presence: true, uniqueness: true 
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: ["Fiction", "Non-Fiction"]
    
    validate :clickbait

    def clickbait
        if title.present? && title.exclude?("Won't Believe" || "Secret" || "Top" || "Guess")
            errors.add(:title, "Be a clickbaiter")
        end
    end
end
