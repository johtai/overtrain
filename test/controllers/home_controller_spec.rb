require 'rspec'
describe HomeController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #error" do
    it "returns http success" do
      get :error
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #search" do
    it "redirects to player page if only one result is found" do
      post :search, params: { username: "example_username" }
      expect(response).to redirect_to("/username/example_username")
    end
    it "assigns all_usernames if more than one result is found" do
      allow(controller).to receive_message_chain(:helpers, :get_all_usernames).and_return({ "total" => 2 })
      post :search, params: { username: "example_username" }
      expect(assigns(:all_usernames)).to eq({ "total" => 2 })
    end
  end

  describe "GET #show" do
    it "redirects to error page if player not found" do
      allow(controller).to receive_message_chain(:helpers, :get_username_stats).and_return({ 'error' => 'Player not found' })
      get :show, params: { username: "nonexistent_username" }
      expect(response).to redirect_to("/error")
    end
    it "assigns player_summary and player_stats" do
      allow(controller).to receive_message_chain(:helpers, :get_username_stats).and_return({ 'key' => 'value' })
      allow(controller).to receive_message_chain(:helpers, :get_username_summary).and_return({ "username" => "example_username" })
      get :show, params: { username: "example_username" }
      expect(assigns(:player_summary)).to eq({ "username" => "example_username" })
      expect(assigns(:player_stats)).to eq({ 'key' => 'value' })
    end
  end

  describe "POST #subscribe" do
    it "creates a subscription for the user and player if not already subscribed" do
      user_id = 1
      player_summary = { "username" => "example_username" }
      player_stats = { "key" => "value" }
      subscription_double = double(Subscription)
      allow(subscription_double).to receive(:present?).and_return(false)
      allow(Subscription).to receive(:where).and_return(subscription_double)

      post :subscribe, params: { user_id: user_id, player_summary: player_summary, player_stats: player_stats }

      expect(assigns(:player_summary)).to eq(player_summary)
      expect(assigns(:player_stats)).to eq(player_stats)
    end
  end

  describe "GET #help" do
    it "redirects to home page" do
      get :help
      expect(response).to redirect_to("/")
    end
  end

  describe "GET #about" do
    it "redirects to home page" do
      get :about
      expect(response).to redirect_to("/")
    end
  end
end