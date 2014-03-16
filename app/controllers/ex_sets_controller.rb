class ExSetsController < ApplicationController
  before_action :set_ex_set, only: [:show, :edit, :update, :destroy]

  def index
    @ex_sets = ExSet.all
  end

  def show
  end

  def new
    @ex_set = ExSet.new
  end

  def edit
  end

  def create
    @ex_set = ExSet.new(ex_set_params)

    if @ex_set.save
      redirect_to @ex_set, notice: 'Ex set was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @ex_set.update(ex_set_params)
      redirect_to @ex_set, notice: 'Ex set was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @ex_set.destroy
        redirect_to ex_sets_url
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
