class RefusedTransfersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_signed_in?
  before_action :current_user
  before_action :user_session
  before_action :set_refused_transfer, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @refused_transfers = RefusedTransfer.where(aceita: false)
    #respond_with(@refused_transfers)
    respond_to do |format|
      format.html
      format.json {render json: @refused_transfers}
    end
  end

  def show
    respond_with(@refused_transfer)
  end

  private
    def set_refused_transfer
      @refused_transfer = RefusedTransfer.find(params[:id])
    end
end
