#
class TagsController < ApplicationController
  before_action :authenticate_admin!, except: :index
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def show
  end

  def new
    @tag = Tag.new
  end

  def edit
  end

  def create
    @tag = Tag.new(tag_params)

    respond_to do |format|
      if @tag.save!
        format.html do
          redirect_to @tag,
          notice: 'Tag was successfully created.'
        end
        format.json { render :show, status: :created, location: @tag }
      else
        format.html { render :new }
        format.json do
          render json: @tag.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html do
          redirect_to @tag,
          notice: 'Tag was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit }
        format.json do
          render json: @tag.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @tag.destroy
    respond_to do |format|
      format.html do
        redirect_to tags_url,
        notice: 'Tag was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:title)
  end
end
