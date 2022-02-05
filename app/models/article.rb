# feature: validation
# Helps in dealing with the invalid user input

class Article < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
end
