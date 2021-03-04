class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :title_bait
    
    def title_bait
        bait = ["Won't Believe", "Secret", "Top [number]", "Guess"]
        if title.present? && !bait.any? { |x| self.title.include? x }
        errors.add(:title, "is this working")
        end
    end
end
