class PhotosController < ApplicationController

before_action :configure_permitted_parameters, if: :devise_controller?
protect_from_forgery with: :exception

before_action :authenticate_user!
before_action :set_photo, only: [:edit, :update, :destroy]

  def index
    @photos = Photo.all
    #raise
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
       @photo=Photo.new(photos_params)
       @photo.user_id = current_user.id
    if @photo.save
      redirect_to photos_path, notice: "投稿しました！"
      NoticeMailer.sendmail_photo(@photo).deliver
    else
      render action: 'new'
    end
  end


  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo.update(photos_params)
    redirect_to photos_path, notice: "編集しました！"
  end

  def destroy
    @photo.destroy
    redirect_to photos_path, notice: "削除しました！"

  end


  PERMISSIBLE_ATTRIBUTES = %i(photo avatar avatar_cache)

    private

      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:save, keys: PERMISSIBLE_ATTRIBUTES)
      end










  private
    def photos_params
      params.require(:photo).permit(:title, :content, :image)
    end

    def set_photo
        @photo = Photo.find(params[:id])
    end

end
