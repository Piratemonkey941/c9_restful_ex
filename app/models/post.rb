class Post < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true

    has_many :comments

    def self.search(query)
        where("title LIKE ? OR body LIKE ?", "%#{query}%", "%#{query}%")
      end
end
