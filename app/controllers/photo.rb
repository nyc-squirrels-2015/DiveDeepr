require "json"

get "/dive_logs/:id/show/photos/all.json" do |id|
  @photos = Photo.all.where(dive_logs_id: id)
  erb :'photos/all', layout: false
end

get "/dive_logs/:id/show/photos/new.json" do |id|
  erb :'photos/new', layout: false
end

post "/dive_logs/:id/show/photos.json" do |id|
  @dive_log = DiveLog.find(id)

  if request.xhr?
    new_photo = Photo.create(url: params[:url], dive_logs_id: @dive_log.id)

    # return {path: "/dive_logs/#{id}/show/photos/all"}.to_json
  else
    return 501
  end

end

