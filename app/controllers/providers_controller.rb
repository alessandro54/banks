class ProvidersController < ApplicationController
  def new
    @provider = Provider.new
  end

  def create
    @provider = Provider.new(provider_params)

    if @provider.save
      redirect_to provider_url(@provider), notice: 'Provider was successfully created.'
    else
      render :new, locals: { model: @provider }, status: :unprocessable_entity
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
end
