class Question < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :answers, dependent: :destroy
  has_rich_text :content
end
