# app/controllers/likes_controller.rb
class LikesController < ApplicationController
  before_action :require_login
  before_action :set_likeable

  # Créer un like
  def create
    @like = @likeable.likes.find_or_initialize_by(user: current_user)
    if @like.persisted?
      flash[:alert] = "Vous avez déjà liké !"
    elsif @like.save
      flash[:success] = "Like ajouté 👍"
    else
      flash[:alert] = "Impossible de liker."
    end
    redirect_back fallback_location: root_path
  end

  # Supprimer un like
  def destroy
    @like = @likeable.likes.find_by(user: current_user)
    if @like&.destroy
      flash[:success] = "Like retiré 👎"
    else
      flash[:alert] = "Impossible de retirer le like."
    end
    redirect_back fallback_location: root_path
  end

  private

  def set_likeable
    resource, id = request.path.split("/")[1, 2] # ex: ["gossips", "12"]
    @likeable = resource.singularize.classify.constantize.find(id)
  end
end
