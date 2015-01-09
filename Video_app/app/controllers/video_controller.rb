'require fileutils'
'require Cloudinary'
require 'base64'

class VideoController < ApplicationController
  def create
	  if !@user.present?
		  cookies[:error] = "You must be logged in to do that"
		  redirect_to create_path and return
	  end
  end

  def try_create

	  if !params[:video_file].present? && !params[:title].present?
		  cookies[:error] = "Video and Title is required"
		  redirect_to v_create_path and return
	  end

	  @cur_video		= Video.new()
	  @cur_video.title	= params[:title]
	  @cur_video.description= params[:description]
	  @cur_video.users_id	= @user.id
	  @cur_video.save()

	  #Uploads image to cloud
	  if params[:image_file].present?
	  	Cloudinary::Uploader.upload(params[:image_file],
					    :public_id=> @cur_video.id,
					    :eager	=> [{	
						    :width => 100, 
						    :height=> 100, 
						    :crop  => :fill } ])
	  end

	  @cur_video.imagefilepath = @cur_video.id
	  @cur_video.filepath = '/videos/' + @cur_video.id.to_s + 1.to_s + '.mp4'

	  # Make folder
	  dir = File.dirname(Rails.public_path.to_s + '/videos/')
	  unless File.directory?(dir)
		  FileUtils.mkdir_p(dir)
	  end

	  # Encode file
	  # Decode to different file
	  # Delete encoded file
	  video_saved_file = File.new(Rails.public_path.to_s + @cur_video.id.to_s,"wb")
	  video_saved_file.write(Base64.encode64(params[:video_file].read))
	  video_saved_file.close
	  video_saved_file = File.open(Rails.public_path.to_s + @cur_video.id.to_s,"rb")

	  video_saved = File.new(Rails.public_path.to_s + @cur_video.filepath,"wb")
	  video_saved.write(Base64.decode64(video_saved_file.read))
	  video_saved_file.close
	  File.delete(video_saved_file)
	  video_saved.close

	  @cur_video.save()
	  cookies[:success] = "Successful Upload"
	  
	  redirect_to v_create_path and return
  end

  def search
  end

  def show
	  if params[:id].nil?
		  redirect_to root_path
	  else
	  	@cur_video = Video.find(params[:id])
		@video_author = User.find(@cur_video.users_id)
	  end
  end

  def Download
	  send_file "#{Rails.root}/public#{params[:filename].to_s}", :x_sendfile => true
  end
	  
end
