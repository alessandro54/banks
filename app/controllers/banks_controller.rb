class BanksController < BaseController
  before_action :set_bank, only: [:show, :update, :destroy]
  def index
    @banks = Bank.all
  end

  def show; end

  def new; end

  def create
    @bank = Bank.new(bank_params)
    if @bank.save
      redirect_to banks_path, notice: I18n.t('controllers.banks.create.success')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @bank.update(bank_params)
      redirect_to bank_path(@bank), notice: I18n.t('controllers.banks.update.success')
    else
      render :edit
    end
  end

  def destroy
    @bank.destroy
    redirect_to banks_path, notice: I18n.t('controllers.banks.destroy.success')
  end


  private

  def bank_params
    params.require(:bank).permit(:name)
  end

  def set_bank
    @bank = Bank.find(params[:id])
  rescue
    render status: 404
  end
end
