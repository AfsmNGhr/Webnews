#
class TidingsController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @tidings = Tiding.all
    @categories = Category.all
  end

  def show
  end

  def new
    @tiding = Tiding.new(params[:tiding])
  end

  def edit
    respond_to do |format|
      format.json do
        if @tiding.update!(tiding_params)
          head :ok
        else
          render json: @tiding.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  def create
    @tiding = Tiding.new(params[:tiding])

    respond_to do |format|
      format.json do
        if @tiding.save
          render json: @tiding, status: :created
        else
          render json: @tiding.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  def update
    respond_to do |format|
      format.json do
        if @tiding.update!(tiding_params)
          render json: @tiding, status: :ok
        else
          render json: @tiding.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  def delete
    @tiding.destroy

    respond_to do |format|
      format.json { head :ok }
    end
  end

  private

  def set_tiding
    @tiding = Tiding.find(params[:id])
  end

  def tiding_params
    params.require(:tiding).permit(:id, :title, :text)
  end
end
