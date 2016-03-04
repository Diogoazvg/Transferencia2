class TransfersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_signed_in?
  before_action :current_user
  before_action :user_session
  before_action :set_transfer, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
      @transfers = Transfer.page(params[:page]).per(15).where(aceita: nil)
      respond_to do |format|
        format.html
        format.xml {render xml: @transfers}
        format.json {render json: @transfers}
      end
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
      @transfer.update(transfer_params)
      @dados2 = Matricula.transferencia(@@var.COD_TURNO, @@var.COD_TURMA, @@var.COD_ALUNO)
      respond_with(@transfer)
      flash[:notice] = "Tranferência realizada com sucesso."
    else
      @transfer.update(transfer_params)
      render :edit
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
      @dados3 = Turma.alunos_por_turma(@@var.COD_TURMA).count
    end

    def transfer_params
      params.require(:transfer).permit(:COD_TURNO, :COD_TURMA, :COD_ALUNO, :justificativa, :aceita, :cond)
    end
end
