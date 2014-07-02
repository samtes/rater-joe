class UsersController < ApplicationController
  # load_and_authorize_resource
  skip_before_action :authenticate_user!, only: :show

  def show
    @user = User.find(params[:id])
     # authorize! :show, @user
  end
end
