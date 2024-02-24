require 'rspec'
describe WikiController do
  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show_heroes" do
    it "assigns @heroes_by_role" do
      heroes = FactoryBot.create_list(:hero, 3)
      get :show_heroes
      expect(assigns(:heroes_by_role)).to eq(heroes.group_by(&:role))
    end
  end

  describe "GET #show_hero" do
    it "assigns @hero" do
      hero = FactoryBot.create(:hero)
      get :show_hero, params: { hero_id: hero.id }
      expect(assigns(:hero)).to eq(hero)
    end
  end

  describe "GET #show_gamemodes" do
    it "assigns @gamemodes" do
      gamemodes = FactoryBot.create_list(:gamemode, 3)
      get :show_gamemodes
      expect(assigns(:gamemodes)).to eq(gamemodes)
    end
  end

  describe "GET #show_maps" do
    it "assigns @maps_by_gamemode" do
      maps = FactoryBot.create_list(:map, 3)
      get :show_maps
      expect(assigns(:maps_by_gamemode)).to eq(maps.group_by { |map| map.gamemodes.first })
    end
  end
end