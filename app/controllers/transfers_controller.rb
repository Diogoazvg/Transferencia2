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
    puts "OLHA, ESTOU AQUI PORRA!!!"
    puts transfer_params[:aceita]
    if transfer_params[:aceita] == "true"
      @dados2 = Matricula.transferencia(@@var.COD_TURNO, @@var.COD_TURMA, @@var.COD_ALUNO)
      @transfer.update(transfer_params)
      #respond_with(@transfer)
      flash[:notice] = "Tranferência realizada com sucesso."
      redirect_to '/transfers'
    end
      
    if transfer_params[:aceita] == "false"
      @transfer.update(transfer_params)
      flash[:notice] = "Pedido negado com sucesso."
      redirect_to '/transfers'
    end

    if transfer_params[:aceita] == nil
      @transfer.update(transfer_params)
      flash[:notice] = "justificativa anxada com sucesso."
      redirect_to '/transfers'
    end
  end

  # def update2
  #   @transfer = Transfer.update(params[:file])
  #   render :edit
  # end

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
      params.require(:transfer).permit(:COD_TURNO, :COD_TURMA, :COD_ALUNO, :justificativa, :aceita, :cond, :my_file)
    end
end
