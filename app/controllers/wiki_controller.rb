class WikiController < ApplicationController
  def index

  end

  def show_heroes
    @heroes_by_role = Hero.all.group_by(&:role)

  end

  def show_hero
    @hero = Hero.all.where(:hero_id => params[:hero_id])[0]
  end

  def show_gamemodes
    @gamemodes = Gamemode.all
  end

  def show_gamemode

  end

  def show_maps
    @maps_by_gamemode = Map.all.group_by{|map| map.gamemodes.first}
  end

  def show_map
  end
end
