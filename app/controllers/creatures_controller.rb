class CreaturesController < ApplicationController
  def index
    @creatures = Creature.all
  end

  def new
    @creature = Creature.new
  end

  def create
    # whitelist params and save them to a variable
    creature_params = params.require(:creature).permit(:name, :description)
    # create a new creature from `creature_params`
    creature = Creature.new(creature_params)

    # if creature saves, redirect to route that displays all creatures
    if creature.save
      redirect_to creature
      # redirect_to creatures_path is equivalent to:
      # redirect_to "/creatures"
    end
  end

  def show
    creature_id = params[:id]
    @creature_id = Creature.find_by_id(creature_id)
  end


  # private

  # def creature_params
  #   # whitelist params return whitelisted version
  #   params.require(:creature).permit(:name, :description)
  # end
end
