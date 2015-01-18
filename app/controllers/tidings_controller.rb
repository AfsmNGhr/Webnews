#
class TidingsController < ApplicationController
  before_action :set_tiding, only: [:show, :edit, :update, :destroy]

  def index
    @tidings = Tiding.all
    @categories = Category.all
  end

  def show
  end

  def new
    @tiding = Tiding.new
  end

  def edit
    respond_to do |format|
      if @tiding.update!(tiding_params)
        format.html do
          redirect_to @tiding,
          notice: 'Tiding was successfully updated.'
        end
        format.json { head :ok }
      else
        format.html { render :edit }
        format.json do
          render json: @tiding.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  def create
    @tiding = Tiding.new(tiding_params)
    respond_to do |format|
      if @tiding.save!
        format.html do
          redirect_to @tiding,
                      notice: 'Tiding was successfully created.'
        end
        format.json { render :show, status: :created, location: @tiding }
      else
        format.html { render :new }
        format.json do
          render json: @tiding.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @tiding.update(tiding_params)
        format.html do
          redirect_to @tiding,
                      notice: 'Tining was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @tiding }
      else
        format.html { render :edit }
        format.json do
          render json: @tiding.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  def delete
    @tiding.destroy

    respond_to do |format|
      format.html do
        redirect_to tidings_url,
                    notice: 'Tining was successfully destroyed.'
      end
      format.json { head :ok }
    end
  end

  private

  def set_tiding
    @tiding = Tiding.find(params[:id])
  end

  def tiding_params
    params.require(:tiding).permit(:id, :title, :text, :image)
  end
end
