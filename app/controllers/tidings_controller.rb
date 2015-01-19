#
class TidingsController < ApplicationController
  before_action :set_tiding, only: [:show, :edit, :update, :destroy]

  def index
    @tidings = Tiding.all.paginate(:page => params[:page], :per_page => 20)
    @tidings_all = Tiding.all
    @categories = Category.all
    @tags = Tag.all
    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
  end

  def new
    @tiding = Tiding.new
  end

  def edit
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
                      notice: 'Tiding was successfully updated.'
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

  def destroy
    @tiding.destroy
    respond_to do |format|
      format.html do
        redirect_to tidings_url,
                    notice: 'Tiding was successfully destroyed.'
      end
      format.json { head :ok }
    end
  end

  private

  def set_tiding
    @tiding = Tiding.find(params[:id])
  end

  def tiding_params
    params.require(:tiding).permit(:id, :title, :text, :preview,
                                   :image, :remote_image_url)
  end
end
