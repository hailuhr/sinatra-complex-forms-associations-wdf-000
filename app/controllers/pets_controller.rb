class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    erb :'/pets/new'
  end

  post '/pets' do
    @pet = Pet.create(params["pet"])
    if !params["owner_name"].empty?
      # binding.pry
      @pet.owner = Owner.create(name: params["owner_name"])
    end
    @pet.save
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end


  get '/pets/:id/edit' do
    @pet = Pet.find(params[:id])
    erb :'/pets/edit'
  end

  post '/pets/:id' do
    @pet = Pet.find(params[:id])
    #  binding.pry

    @pet.update(params["pet"])
    if !params["owner"]["name"].empty?
      # binding.pry
      name = params["owner"]["name"]
      @pet.owner = Owner.create(:name => name)
    end
    @pet.save
    # binding.pry
    redirect to "pets/#{@pet.id}"
  end

end
