class CommentsController < ApplicationController
  before_action :set_gossip
  before_action :set_comment, only: [ :edit, :update, :destroy ]

  def create
    @comment = @gossip.comments.new(comment_params)
    @comment.user = User.first # utilisateur anonyme pour l'instant
    if @comment.save
      redirect_to @gossip
    else
      render "gossips/show"
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to @gossip
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to @gossip
  end

  private

  def set_gossip
    @gossip = Gossip.find(params[:gossip_id])
  end

  def set_comment
    @comment = @gossip.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
