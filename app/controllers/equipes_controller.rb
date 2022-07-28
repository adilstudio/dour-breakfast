class EquipesController < ApplicationController
  def index
    @equipe = Equipe.all
  end

  def show
    @equipe = Equipe.find(params[:id])
  end


  def new
    @equipe = Equipe.new
  end

  def create
      @equipe = Equipe.create(equipe_params)
    if @equipe.save
      redirect_to equipes_path(@equipe.id), success: "L'équipe a bien été créée"
    else
      render :new
    end
  end


  def edit
    @equipe = Equipe.find(params[:id])
  end

  def update
    @equipe = Equipe.find(params[:id])
    equipe_params = params.require(:equipe).permit(:nom, :ville)
    if @equipe.update(equipe_params)
      redirect_to equipes_path, success: "L'équipe a bien été modifiée"
    else
      render :edit
    end
  end

  def delete
  @equipe = Equipe.find(params[:id])
  end

  def destroy
    @equipe = Equipe.find(params[:id])
    @equipe.destroy
    redirect_to equipes_path
  end

  private

  def equipe_params
  params.require(:equipe).permit(:nom, :ville)

  end




end
