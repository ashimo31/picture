class PhotosController < ApplicationController

before_action :authenticate_user!
before_action :set_photo, only: [:edit, :update, :destroy]

  def index
    @photos = Photo.all
  end

  def new
    if params[:back]
     @photo = Photo.new(photos_params)
   else
    @photo = Photo.new
   end
  end

  def confirm
    @photo = Photo.new(photos_params)
    render :new if @photo.invalid?
  end

  def create
       ＠photo=Photo.create(photos_params)
       @photo.user_id = current_user.id
    if @photo.save
      redirect_to photos_path, notice: "投稿しました！"
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    @photo.update(photos_params)
    redirect_to photos_path, notice: "編集しました！"
  end

  def destroy
    @photo.destroy
    redirect_to photos_path, notice: "削除しました！"

  end

  private
    def photos_params
      params.require(:photo).permit(:title, :content, :image)
    end

    def set_photo
        @photo = Photo.find(params[:id])
    end

end
