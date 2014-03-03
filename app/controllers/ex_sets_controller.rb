class ExSetsController < ApplicationController
  before_action :set_ex_set, only: [:show, :edit, :update, :destroy]

  # GET /ex_sets
  # GET /ex_sets.json
  def index
    @ex_sets = ExSet.all
  end

  # GET /ex_sets/1
  # GET /ex_sets/1.json
  def show
  end

  # GET /ex_sets/new
  def new
    @ex_set = ExSet.new
  end

  # GET /ex_sets/1/edit
  def edit
  end

  # POST /ex_sets
  # POST /ex_sets.json
  def create
    @ex_set = ExSet.new(ex_set_params)

    respond_to do |format|
      if @ex_set.save
        format.html { redirect_to @ex_set, notice: 'Ex set was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ex_set }
      else
        format.html { render action: 'new' }
        format.json { render json: @ex_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ex_sets/1
  # PATCH/PUT /ex_sets/1.json
  def update
    respond_to do |format|
      if @ex_set.update(ex_set_params)
        format.html { redirect_to @ex_set, notice: 'Ex set was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ex_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ex_sets/1
  # DELETE /ex_sets/1.json
  def destroy
    @ex_set.destroy
    respond_to do |format|
      format.html { redirect_to ex_sets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ex_set
      @ex_set = ExSet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ex_set_params
      params.require(:ex_set).permit(:sets, :reps, :weight)
    end
end
