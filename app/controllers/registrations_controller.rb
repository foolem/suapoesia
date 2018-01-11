class RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication, only: [:new, :create, :cancel]

  def new
    @user = User.new
  end

  def create
    role = sign_up_params[:role]
    if role == "admin"
      if user_signed_in? && current_user.role == "admin"
        create_admin
      else
        respond_to do |format|
          format.html { redirect_to poems_path, notice: 'Você não tem permissão para criar um admin.' }
        end
      end
    elsif role == "appraiser"
      if user_signed_in? && current_user.role == "admin"
        create_appraiser
      else
        respond_to do |format|
          format.html { redirect_to poems_path, notice: 'Você não tem permissão para criar um avaliador.' }
        end
      end
    else
      sign_up_params[:role] = "user"
      @user =  User.create(sign_up_params)
      respond_to do |format|
        if @user.save
          sign_in(@user)
          if !user_signed_in?
            format.html { redirect_to poems_path, notice: 'User was successfully created.' }
          end
          format.html { redirect_to poems_path, notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def create_admin
    if user_signed_in? && current_user.role == "admin"
      @user =  User.create(sign_up_params)
      respond_to do |format|
        if @user.save
          format.html { redirect_to users_path, notice: 'Admin criado com sucesso.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to users_path, notice: 'Você não tem permissão para criar um admin.' }
      end
    end
  end

  def create_appraiser
    if user_signed_in? && current_user.role == "admin"
      @user =  User.create(sign_up_params)
      respond_to do |format|
        if @user.save
          format.html { redirect_to users_path, notice: 'Avaliador criado com sucesso.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to users_path, notice: 'Você não tem permissão para criar um avaliador.' }
      end
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :role, :email, :password, :password_confirmation)
  end


end
