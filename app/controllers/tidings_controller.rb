#
class TidingsController < ApplicationController
  def index
    @tidings = Tiding.all
  end

  def show
    @tiding = Tiding.find(params[:id])
  end

  def new
    @tiding = Tiding.new(params[:tiding])
  end

  def edit
    @tiding = Tiding.find(params[:id])

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
    @tiding = Tiding.find(params[:id])

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
    @tiding = Tiding.find(params[:id])
    @tiding.destroy

    respond_to do |format|
      format.json { head :ok }
    end
  end

  private

  def tiding_params
    params.require(:tiding).permit(:id, :title, :text)
  end
end
