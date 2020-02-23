class ClientsController < ApplicationController
  before_action :set_client, only: [:edit, :update, :show]
  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params(:post))

    if @client.save
      redirect_to clients_path, notice: 'Client registered successful'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @client.update(client_params(:patch))
      redirect_to clients_show_path, notice: 'Customer updated successfull'
    else
      render :edit
    end
  end

  private
  def set_client
    @client = Client.find(params[:id])
  end

  def client_params(method)
    params.require(method).permit(:id, :name, :email, :smoker, :phone, :avatar)
  end
end
