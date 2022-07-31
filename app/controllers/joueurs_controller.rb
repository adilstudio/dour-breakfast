class JoueursController < ApplicationController
  def index
    @joueur = Joueur.all
  end

  def show
    @joueur = Joueur.find(params[:id])
  end

  def new
    @joueur = Joueur.new
  end

  def create
    @joueur = Joueur.create(joueur_params)

    if @joueur.save
      redirect_to joueurs_path(@joueur.id), notice: "Le joueur a bien été créé"
    else
      render :new
    end
  end

  def edit
    @joueur = Joueur.find(params[:id])

  end

  def update
    @joueur = Joueur.find(params[:id])
    respond_to do |format|
      if @joueur.update(joueur_params)
          format.js
          format.html { redirect_to joueurs_path, success: "Le joueur a bien été modifié" }
      else
        render :edit
      end
    end
  end

  def delete
  @joueur = Joueur.find(params[:id])
  end

  def destroy
    @joueur = Joueur.find(params[:id])
    @joueur.destroy
    redirect_to joueurs_path
  end

  private

  def joueur_params
    params.require(:joueur).permit(:nom, :poste, :equipes_id)

  end


end
