require 'sinatra'
require 'json'
require 'thin'
require 'rack'
require_relative "VIN"

vin = VIN.new

set :port, 8080

get '/vin' do
  'Welcome to VIN Rest api'
end

get '/vin/sub/:id' do |userid|
  number = userid.to_i
  if number
    response = vin.getSubscriber(number)
    if response['errors'].empty?
      body response.to_json
      status 200
    else
      status 404
      body response.to_json
    end
  else
    status 404
  end
end

post '/vin/sub' do
  data = JSON.parse(request.body.read)

  if !data['name'] || !data['email'] || !data['phone'] || !data['address']
    status 400
  else
    response =  vin.addSubscriber(data['name'],data['email'],data['phone'],
                          data['address']['street'],data['address']['city'],
                          data['address']['state'], data['address']['zip'])

    if !response['errors'].empty?
      status 201
    else
      status 204
    end
    body response.to_json
  end
end

put '/vin/sub/:id' do |userid|
  data = JSON.parse(request.body.read)


end

get '/vin/admin' do
  response = vin.getAdmins
  if response['errors'].empty?
    status 200
  else
    status 400
  end
end

get '/vin/admin/:id' do |userid|
  number = userid.to_i
  if number
    response = vin.getAdmin(number)
  else
    status 404
  end
end

post '/vin/admin' do
    data = JSON.parse(request.body.read)
    if !data['name']
      status 400
    else
      response = vin.addAdmin(data['name'])
      if !response['errors'].empty?
        status 201
      end
    end
    body response.to_json
end

put '/vin/admin/:id' do |userid|
end
