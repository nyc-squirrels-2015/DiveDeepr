get "/dive_logs/:id/show/photos/all" do |id|
  @photos = Photo.all.where(dive_logs_id: id)
  erb :'photos/all'
end

get "/dive_logs/:id/show/photos/new" do |id|
  erb :'photos/new'
end

post "/dive_logs/:id/show/photos" do |id|
  @dive_log = DiveLog.find(id)
  new_photo = Photo.create(url: params[:url], dive_logs_id: @dive_log.id)

  if new_photo.save
    puts "Photo saved"
    redirect "/dive_logs/#{id}/show/photos/all"
  else
    puts "problem saving photo"
    redirect "/dive_logs/#{id}/show/photos/new"
  end

end