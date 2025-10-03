class SessionsController < ApplicationController
  def new
    # Affiche le formulaire de login
  end

  def create
    # On va chercher l'utilisateur par email
    user = User.find_by(email: params[:email])

    # On vérifie le mot de passe
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Connexion réussie !"
    else
      flash.now[:alert] = "Email ou mot de passe invalide"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "Déconnecté avec succès"
  end
end
