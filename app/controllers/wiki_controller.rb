class WikiController < ApplicationController
  def index
    @heroes = Hero.all
    #@heroes_by_role = Hero.all.group_by(&:role)
    @maps = Map.all
    @gamemodes = Gamemode.all

  end

  def show_heroes
  end

  def show_hero
    @hero = Hero.find(params[:id])
  end

  def show_gamemodes
  end

  def show_gamemode
  end

  def show_maps
  end

  def show_map
  end
end
