class CreaturesController < ApplicationController
  def home
    render :home
  end

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

  def edit
    creature_id = params[:id]
    @creature =Creature.find_by_id(creature_id)
  end

  # update a creature in the database
  def update
    # get the creature id from the url params
    creature_id = params[:id]

    # use `creature_id` to find the creature in the database
    creature = Creature.find_by_id(creature_id)

    # whitelist params and save them to a variable
    creature_params = params.require(:creature).permit(:name, :description)

    # update the creature
    creature.update_attributes(creature_params)

    # redirect to show page for the updated creature
    redirect_to creature
    # redirect_to creature_path(creature) is equivalent to:
    # redirect_to "/creatures/#{creature.id}"
  end

  def destroy
    creature_id = params[:id]

    creature = Creature.find_by_id(creature_id)

    creature.destroy

    redirect_to creatures_path

  end

  private

  def creature_params
    # whitelist params return whitelisted version
    params.require(:creature).permit(:name, :description)
  end

end
