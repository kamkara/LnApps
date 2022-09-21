class VotesController < ApplicationController
  include ActionView::RecordIdentifier
  before_action :authenticate_user!

  def show
    @comment = Comment.find(params[:comment_id])
    @vote = Vote.find_or_create_by(user: current_user, comment: @comment)

    case params[:choice]
    when 'up_vote'
      @vote.up_vote? ? @vote.cancel! : @vote.up_vote!
    when 'down_vote'
      @vote.down_vote? ? @vote.cancel! : @vote.down_vote!
    end
  end

end