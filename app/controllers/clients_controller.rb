class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    save_client_or_render 'new'
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    @client.assign_attributes(client_params)
    save_client_or_render 'edit'
  end

  private

  def client_params
    params
      .require(:client)
      .permit(:name, :contact_email, :account_number, :address)
  end

  def save_client_or_render failure_view
    if @client.save
      flash_save_success @client.name
      redirect_to client_path(@client)
    else
      flash_validation_error
      render failure_view
    end
  end

  # TODO: Pull these out into a concern
  def flash_save_success object_name
    flash[:success] = "Your changes to #{object_name} have been saved."
  end

  def flash_validation_error
    flash[:danger] = 'There was a problem with your input. Please correct the errors below, and try again.'
  end
end
