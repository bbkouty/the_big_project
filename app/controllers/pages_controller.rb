


class PagesController < ApplicationController
  def contact
  end

  def send_message
    name = params[:name]
    email = params[:email]
    message = params[:message]

    # Ici, tu pourrais ajouter un envoi d’email, ou juste afficher un message
    flash[:notice] = "Merci #{name}, votre message a bien été envoyé ✅"
    redirect_to contact_path
  end
end
