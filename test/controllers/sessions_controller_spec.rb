require 'rspec'
describe SessionsController, type: :controller do

  describe "POST #create" do
    context "with valid credentials" do
      it "creates a new session for the user" do
        user = User.create(user_id: 'testuser', password: 'password')
        post :create, params: { session: { user_id: 'testuser', password: 'password' } }
        expect(session[:user_id]).to eq(user.id)
        expect(response).to redirect_to('/')
        expect(flash[:notice]).to eq('Вы вошли на сайт!')
      end
    end

    context "with invalid credentials" do
      it "renders the new template with an alert" do
        post :create, params: { session: { user_id: 'invaliduser', password: 'invalidpassword' } }

        expect(session[:user_id]).to be_nil
        expect(response).to render_template(:new)
        expect(flash[:alert]).to eq('Не правильный email или пароль')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the current session and redirects to root" do
      session[:user_id] = 123
      delete :destroy
      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to('/')
      expect(flash[:notice]).to eq('Вы вышли из аккаунта')
    end
  end

end

