class ClientsController < ApplicationController
  before_action :authenticate_user!

  def index
    @clients = current_user.clients
  end

  def show
    @client = current_user.clients.find(params[:id])
  end

  def destroy
    @client = current_user.clients.find(params[:id])
    @client.destroy
    redirect_to clients_path, notice: "Client deleted successfully."
  end
end