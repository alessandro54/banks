class ProvidersController < ApplicationController
  def new; end

  def create
    @provider = Provider.new(provider_params)

    if @provider.save
      redirect_to @provider
    else
      render 'new'
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
