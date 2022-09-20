class Course < ApplicationRecord
  belongs_to :user
  has_rich_text :content
  has_many :questions, dependent: :destroy
end
