#
class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @tags = Tag.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @tag = Tag.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @tag = Tag.new(tags_params)

    respond_to do |format|
      if @tag.save!
        format.html do
          notice: 'Tag was successfully created.'
        end
        format.json { status: :created, location: @category }
      else
        format.html { render :new }
        format.json do
          render json: @category.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html do
          notice: 'Tag was successfully updated.'
        end
        format.json { status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json do
          render json: @category.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @tag.destroy
    respond_to do |format|
      format.html do
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
