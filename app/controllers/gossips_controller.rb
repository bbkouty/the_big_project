class GossipsController < ApplicationController
    def index
        @gossips = Gossip.all
    end

    def show
        @gossip = Gossip.find(params[:id])
    end

    def new
        @gossip = Gossip.new
    end

    def create
        @gossip = Gossip.new(title: params[:title], content: params[:content], user: User.first) # temporaire: le user sera le premier de la base
        if @gossip.save
            redirect_to root_path, notice: "Gossip créé avec succès !"
        else
            render :new, status: :unprocessable_entity
        end
    end
end
