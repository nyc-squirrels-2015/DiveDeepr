get "/dive_logs/all" do

  @dive_logs = DiveLog.all.where(user_id: current_user.id)
  erb :'logs/all'
end

get "/dive_logs/:id/show" do |id|
  @dive_log = DiveLog.find(id)
  session[:dive_log_id] = @dive_log.id
  erb :'logs/show'
end

get "/dive_logs/new" do
  erb :'logs/new'
end

post "/dive_logs/new" do
  new_log = DiveLog.create(params[:log])

  session[:dive_log_id] = new_log.id

  new_log.update(time_in: Time.parse(params[:log][:time_in]), time_out: Time.parse(params[:log][:time_out]))

  redirect "/dive_logs/all"

end

get "/dive_logs/:id/edit" do |id|
  @dive_log = DiveLog.find(id)
  erb :'logs/edit'
end

put "/dive_logs/:id/edit" do |id|
  @dive_log = DiveLog.find(id)
  @dive_log.update_attributes(params[:log])
  p "*"*30
  puts "Log updated"
  redirect "/dive_logs/all"
end

delete "/dive_logs/:id" do |id|
  DiveLog.delete(id)

  redirect '/dive_logs/all'

end

