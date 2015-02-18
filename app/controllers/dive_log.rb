get "/dive_logs/all" do

  @dive_logs = DiveLog.all.where(user_id: current_user.id)
  erb :'logs/all'
end

get "/dive_logs/:id/show" do |id|
  @dive_log = DiveLog.find(id)
  erb :'logs/show'
end

get "/dive_logs/new" do
  erb :'logs/new'
end

post "/dive_logs/new" do
  new_log = DiveLog.create(params[:log])

  puts "*"*30
    p new_log
  puts "*"*30

  new_log.update(time_in: Time.parse(params[:log][:time_in]), time_out: Time.parse(params[:log][:time_out]))

  puts "*"*30
    p new_log
  puts "*"*30

  redirect "/dive_logs/all"

end

