class TopController < ApplicationController


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

end
