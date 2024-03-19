# frozen_string_literal: true

class FoldersController < AuthorizedController
  before_action :set_folder, only: %i[show update destroy edit]

  def index
    @folders = Folder.all
  end

  def show
    @settings.update(selection: @folder)
  end

  def new
    @folder = Folder.new
  end

  def edit; end

  def create
    @folder = Folder.create(folder_params)

    if @folder
      redirect_back_or_to @folder, notice: 'Folder was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @folder.update(folder_params)
      redirect_to folders_url, notice: 'Folder was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @folder.destroy!

    redirect_to folders_url, notice: 'Folder was successfully destroyed.'
  end

  private

  def folder_params
    params.require(:folder).permit(:title)
  end

  def set_folder
    @folder = Folder.find(params[:id])
  end
end
