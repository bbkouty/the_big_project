class GossipsController < ApplicationController
    before_action :set_gossip, only: [ :show, :edit, :update, :destroy ]
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
        @gossip = Gossip.new(gossip_params.merge(user: User.first)) # temporaire: associe toujours le premier user
        if @gossip.save
            redirect_to root_path, notice: "Gossip créé avec succès !"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @gossip.update(gossip_params)
            redirect_to gossip_path(@gossip), notice: "Gossip mis à jour avec succès !"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @gossip.destroy
        redirect_to root_path, notice: "Gossip supprimé avec succès !"
    end

    private

    def set_gossip
        @gossip = Gossip.find(params[:id])
    end

    def gossip_params
        params.require(:gossip).permit(:title, :content, :user_id, tag_ids: [])
    end
end
