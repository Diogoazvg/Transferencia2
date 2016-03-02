class TransfersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_signed_in?
  before_action :current_user
  before_action :user_session
  before_action :set_transfer, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    #if @tra: params[:cond] == "true"
      @transfers = Transfer.where(aceita: nil)
      @transfers = Transfer.page(params[:page]).per(15)
      respond_to do |format|
        format.html
        format.xml {render xml: @transfers}
        format.json {render json: @transfers}
      end
    #end
  end

  def show
    respond_with(@transfer)
  end

  def new
    #@transfer = Transfer.new
    #respond_with(@transfer)
  end

  def edit
  end

  def create
    @transfer = Transfer.new(transfer_params)
    @transfer.save
    respond_with(@transfer)
  end

  def update
    if transfer_params[:aceita] == "true"
      print "ESTOU AQUI !!!!!"
      puts transfer_params[:aceita]
      @transfer.update(transfer_params)
      @dados2 = Matricula.transferencia(@@var.COD_TURNO, @@var.COD_TURMA, @@var.COD_ALUNO)
      respond_with(@transfer)
      flash[:notice] = "Tranferência realizada com sucesso."
      #redirect_to :index
    else #transfer_params[:aceita] == "false"
      @transfer.update(transfer_params)
      render :edit
      #flash[:notice] = "Pedido negado."
    end
  end

  def destroy
    @transfer.destroy
    respond_with(@transfer)
  end

  private
    def set_transfer
      @transfer = Transfer.find(params[:id])
      @@var = @transfer
    end

    def transfer_params
      params.require(:transfer).permit(:COD_TURNO, :COD_TURMA, :COD_ALUNO, :justificativa, :aceita, :cond)
    end
end
