class ProvidersController < BaseController
  before_action :set_provider, only: %i[show edit update]

  def index
    @pagy, @providers = pagy(Provider.all)
  end

  def show; end
  def new
    @provider = Provider.new
  end

  def create
    @provider = Provider.new(provider_params)

    if @provider.save
      redirect_to providers_path, notice: 'Provider was successfully created.'
    else
      render :new, locals: { model: @provider }, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @provider.update(provider_params)
      redirect_to providers_path
    else
      render :edit, locals: { model: @provider }, status: :unprocessable_entity
    end
  end


  private

  def provider_params
    params.require(:provider).permit(:name,
                                     :nit,
                                     :contact_name,
                                     :contact_phone,
                                     :account_number,
                                     :bank_id)
  end

  def set_provider
    @provider = Provider.find(params[:id])
  end
end
