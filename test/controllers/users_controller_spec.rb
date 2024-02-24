require 'rspec'
describe UsersController, type: :controller do
  describe "GET #new" do
    it "assigns a new user to @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    it "creates a new user" do
      expect {
        post :create, params: { user: { user_id: 'newuser', password: 'password123' } }
      }.to change(User, :count).by(1)
    end
    it "redirects to the root path" do
      post :create, params: { user: { user_id: 'newuser', password: 'password123' } }
      expect(response).to redirect_to('/')
    end
    it "sets a flash notice" do
      post :create, params: { user: { user_id: 'newuser', password: 'password123' } }
      expect(flash[:notice]).to eq('Вы успешно зарегистрировались!')
    end
  end
end