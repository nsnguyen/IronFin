class WelcomeController < ApiController
  def index
    render json: {
        success: true
    }
  end
end
