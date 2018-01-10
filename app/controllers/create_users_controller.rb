class CreateUsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_admin

  def index
    @created_users = User.all
  end

  # GET /user/1
  # GET /user/1.json
  def show
  end

  # GET /user/new
  def new
    @created_user = User.new
  end

  # GET /user/1/edit
  def edit
  end

  # POST /user
  # POST /user.json
  def create
    @created_user = User.new(created_user_params)

    respond_to do |format|
      if @created_user.save
        format.html { redirect_to @created_user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @created_user }
      else
        format.html { render :new }
        format.json { render json: @created_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user/1
  # PATCH/PUT /user/1.json
  def update
    respond_to do |format|
      if @created_user.update(created_user_params)
        format.html { redirect_to @created_user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @created_user }
      else
        format.html { render :edit }
        format.json { render json: @created_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user/1
  # DELETE /user/1.json
  def destroy
    @created_user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @created_user = User.find(params[:id])
    end

    def set_admin
      if current_user.role == "admin"
        return
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def created_user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
    end



end
