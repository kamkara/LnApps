class Vote < ApplicationRecord
  
  include ActionView::RecordIdentifier


  belongs_to :user
  belongs_to :comment
  has_many :votes, dependent: :destroy
  enum choice: { up_vote: 1, down_vote: -1, cancel: 0 }

  after_update_commit do
    broadcast_replace_to "comments",
      target: dom_id(comment),
      partial: "comments/comment", locals: { comment: comment }
  end
end
