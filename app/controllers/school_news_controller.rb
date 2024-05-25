class SchoolNewsController < ApplicationController
  before_action :set_school_news, only: %i[ show edit update destroy ]

  # GET /school_news or /school_news.json
  def index
    @school_news = SchoolNews.all
  end

  # GET /school_news/1 or /school_news/1.json
  def show
  end

  # GET /school_news/new
  def new
    @school_news = SchoolNews.new
  end

  # GET /school_news/1/edit
  def edit
  end

  # POST /school_news or /school_news.json
  def create
    @school_news = SchoolNews.new(school_news_params)

    respond_to do |format|
      if @school_news.save
        format.html { redirect_to school_news_url(@school_news), notice: "School news was successfully created." }
        format.json { render :show, status: :created, location: @school_news }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @school_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school_news/1 or /school_news/1.json
  def update
    respond_to do |format|
      if @school_news.update(school_news_params)
        format.html { redirect_to school_news_url(@school_news), notice: "School news was successfully updated." }
        format.json { render :show, status: :ok, location: @school_news }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @school_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_news/1 or /school_news/1.json
  def destroy
    @school_news.destroy!

    respond_to do |format|
      format.html { redirect_to school_news_index_url, notice: "School news was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_news
      @school_news = SchoolNews.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def school_news_params
      params.require(:school_news).permit(:title, :description, :content, :photo)
    end
end
