# feature: validation
# Helps in dealing with the invalid user input

class Article < ApplicationRecord
    include Visible

    has_many :comments, dependent: :destroy # deletes the comments associated with article
    
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
end
