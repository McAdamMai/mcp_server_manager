class ClientsController < ApplicationController
  def index
    # Fetch all clients belonging to the logged-in user
    @clients = current_user.clients
  end

  def show
    # Fetch the specific client (already exists from our previous step)
    @client = current_user.clients.find(params[:id])
  end
end