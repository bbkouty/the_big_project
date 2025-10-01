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
        @gossip = Gossip.new(gossip_params.merge(user: User.first)) # temporaire: associe toujours le premier user
        if @gossip.save
            redirect_to root_path, notice: "Gossip créé avec succès !"
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def gossip_params
        params.require(:gossip).permit(:title, :content)
    end
end
