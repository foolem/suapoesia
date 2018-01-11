class PoemsController < ApplicationController
  before_action :set_poem, only: [:show, :edit, :update, :destroy]
  before_action :set_categories
  before_action :authenticate_user!, only: [:edit, :update, :create, :new, :destroy]

  def line_breaking(text)
    text = text.gsub!(/\r\n/, '<br>')
    text
  end

  def revert_line_breaking(text)
    text = text.gsub!(/<br>/, "\r\n")
    text
  end

  # GET /poems
  # GET /poems.json
  def index
    @poems = Poem.where(status: 0)

  end

  # GET /poems/1
  # GET /poems/1.json
  def show
  end

  # GET /poems/new
  def new
    @poem = Poem.new
  end

  # GET /poems/1/edit
  def edit
    @poem.content = revert_line_breaking(@poem.content)
    @poem.save
  end

  # POST /poems
  # POST /poems.json
  def create
    poem_params[:content] = line_breaking(poem_params[:content])
    @poem = Poem.new(poem_params)
    respond_to do |format|
      if @poem.save
        format.html { redirect_to @poem, notice: 'Poem was successfully created.' }
        format.json { render :show, status: :created, location: @poem }
      else
        format.html { render :new }
        format.json { render json: @poem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /poems/1
  # PATCH/PUT /poems/1.json
  def update
    poem_params[:content] = line_breaking(poem_params[:content])
    respond_to do |format|
      if @poem.update(poem_params)
        format.html { redirect_to @poem, notice: 'Poem was successfully updated.' }
        format.json { render :show, status: :ok, location: @poem }
      else
        format.html { render :edit }
        format.json { render json: @poem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poems/1
  # DELETE /poems/1.json
  def destroy
    @poem.destroy
    respond_to do |format|
      format.html { redirect_to poems_url, notice: 'Poem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poem
      @poem = Poem.find(params[:id])
    end

    def set_categories
      @categories = Category.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poem_params
      params.require(:poem).permit(:user_id, :name, :status, :content, :category_id)
    end
end
