get '/moves/:id'  do
  move = params[:id]
  moveAI = 5
  message = "I move to the middle."
  content_type :json  # Tells client to read response as JSON
  {move: moveAI, message: message}.to_json
end

get '/moves' do

end
