class ClientsController < ApplicationController
  def index
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to clients_path, notice: 'Client registered successful'
    else
      render :new
    end
  end

  def client_params
    params.require(:client).permit(:id, :name, :email, :smoker, :phone, :avatar)
  end
end
