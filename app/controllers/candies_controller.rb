class CandiesController < ApplicationController
  before_action :set_candy, only: [:show, :edit, :update, :destroy]

  # GET /candies
  # GET /candies.json
  def index
    @candies = Candy.all
  end

  # GET /candies/1
  # GET /candies/1.json
  def show
  end

  # GET /candies/new
  def new
    @candy = Candy.new
  end
  

  # GET /candies/1/edit
  def edit
  end

  # POST /candies
  # POST /candies.json
  def create
  if candy_params[:title] && !candy_params[:title].empty? && [:kit_kat, :skittles, :m_and_ms, :herseys_kiss, :butterfinger, :gummy_bear,
      :twizzler].include?(candy_params[:title].to_sym)

    @candy = Candy.new(candy_params)

    respond_to do |format|
      if @candy.save
        format.html { redirect_to @candy, notice: 'Candy was successfully created.' }
        format.json { render :show, status: :created, location: @candy }
      else
        format.html { render :new }
        format.json { render json: @candy.errors, status: :unprocessable_entity }
      end
   end
 end
end

  # PATCH/PUT /candies/1
  # PATCH/PUT /candies/1.json
  def update
    respond_to do |format|
      if @candy.update(candy_params)
        format.html { redirect_to @candy, notice: 'Candy was successfully updated.' }
        format.json { render :show, status: :ok, location: @candy }
      else
        format.html { render :edit }
        format.json { render json: @candy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candies/1
  # DELETE /candies/1.json
  def destroy
    @candy.destroy
    respond_to do |format|
      format.html { redirect_to candies_url, notice: 'Candy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_candy
      @candy = Candy.friendly.find(params[:id])
    end
    # Use callbacks to share common setup or constraints between actions.
    

    # Never trust parameters from the scary internet, only allow the white list through.
    def candy_params
      params.require(:candy).permit(:title, :discription)
    end
end
