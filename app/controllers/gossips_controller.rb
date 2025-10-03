class GossipsController < ApplicationController
  before_action :set_gossip, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy] # protège les actions sensibles

  def index
    @gossips = Gossip.all
  end

  def show
    @comments = @gossip.comments
    @comment = Comment.new
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(gossip_params)
    @gossip.user = current_user   # associe l’utilisateur connecté

    if @gossip.save
      redirect_to root_path, notice: "Gossip créé avec succès 🎉"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @gossip.update(gossip_params)
      redirect_to gossip_path(@gossip), notice: "Gossip mis à jour avec succès ✅"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @gossip.destroy
    redirect_to root_path, notice: "Gossip supprimé avec succès 🗑️"
  end

  private

  def authorize_user
    unless @gossip.user == current_user
      redirect_to root_path, alert: "Tu n'es pas autorisé à faire ça 🚨"
    end
  end

  def set_gossip
    @gossip = Gossip.find(params[:id])
  end

  def gossip_params
    params.require(:gossip).permit(:title, :content, tag_ids: [])
    # ⚠️ on retire :user_id pour que seul current_user soit pris
  end

  def require_login
    unless current_user
      redirect_to new_session_path, alert: "Tu dois être connecté pour faire ça 🚨"
    end
  end
end
