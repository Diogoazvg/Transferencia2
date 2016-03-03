class PerformedTransfersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_signed_in?
  before_action :current_user
  before_action :user_session
  before_action :set_performed_transfer, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @performed_transfers = PerformedTransfer.page(params[:page]).per(15).where(aceita: true)
    respond_with(@performed_transfers)
    # respond_to do |format|
    #   format.html
    #   format.json {render json: @performed_transfers}
    # end
  end

  def show
    respond_with(@performed_transfer)
  end

  private
    def set_performed_transfer
      @performed_transfer = PerformedTransfer.find(params[:id])
    end
end
