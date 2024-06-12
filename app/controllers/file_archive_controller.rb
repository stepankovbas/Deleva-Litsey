class FileArchiveController < ApplicationController
  before_action :set_file_archive, only: [:show, :edit, :update, :destroy]

  def index
   
  end

  def show
  end

  def new
    @file_archive = FileArchive.new
  end

  def create
    @file_archive = FileArchive.new(file_archive_params)

    if @file_archive.save
      redirect_to @file_archive, notice: 'Файловий архів успішно створено.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @file_archive.update(file_archive_params)
      redirect_to @file_archive, notice: 'Файловий архів успішно оновлено.'
    else
      render :edit
    end
  end

  def destroy
    @file_archive.destroy
    redirect_to file_archives_url, notice: 'Файловий архів успішно видалено'
  end

  private

  def set_file_archive
    @file_archive = FileArchive.find(params[:id])
  end

  def file_archive_params
    params.require(:file_archive).permit(:file_name, :file, :uploaded_by_id, :section_id)
  end
end


