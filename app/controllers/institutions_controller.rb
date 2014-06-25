class InstitutionsController < ApplicationController
  before_action :set_institution, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :create]

  # GET /institutions
  # GET /institutions.json
  def index
    # @institutions = Institution.all
    @institutions = Institution.order("created_at DESC")
    @institutions.each do |institution|
      reviews = institution.reviews
      @num = 0
      for review in reviews
        @num = @num + review.score.to_i
      end
      @num = @num.to_f / reviews.length
    end
  end
  
  # GET /institutions/1
  # GET /institutions/1.json
  # def show
  # end

  # GET /institutions/new
  def new
    @institution = Institution.new

    # @institution.reviews.build
  end

  def show
    @institution = Institution.find(params[:id])
    reviews = @institution.reviews
    if reviews.length > 0
      @num = 0
      for review in reviews
        @num = @num + review.score.to_i
      end
      @num = @num / reviews.length
    else
      @num = 0
    end
  end

  # GET /institutions/1/edit
  # def edit
  # end

  # POST /institutions
  # POST /institutions.json
  def create
    @institution = current_user.institutions.new(institution_params)
    
    respond_to do |format|
      if @institution.save
        format.html { redirect_to @institution, notice: 'Institution was successfully created.' }
        format.json { render :show, status: :created, location: @institution }
      else
        format.html { render :new }
        format.json { render json: @institution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /institutions/1
  # PATCH/PUT /institutions/1.json
  def update
    respond_to do |format|
      if @institution.update(institution_params)
        format.html { redirect_to @institution, notice: 'Institution was successfully updated.' }
        format.json { render :show, status: :ok, location: @institution }
      else
        format.html { render :edit }
        format.json { render json: @institution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /institutions/1
  # DELETE /institutions/1.json
  def destroy
    @institution.destroy
    respond_to do |format|
      format.html { redirect_to institutions_url, notice: 'Institution was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_institution
      @institution = Institution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def institution_params
      params.require(:institution).permit(:name, :type, :length, :measure, :website, :user_id)
    end
end
      