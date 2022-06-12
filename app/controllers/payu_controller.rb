class PayuController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:confirmation]

  def result
    @charge =  Charge.where(uid: params[:referenceCode]).take
    if @charge.nil?
      @error = "No se encontró la información del pago"
    else
      if params[:signature] != signature(@charge, params[:transactionState])
        @error = "La firma no es valida"
      end
    end
  end

  def confirmation
    charge =  Charge.where(uid: params[:reference_sale]).take

    if charge.nil?
      head :unprocessable_entity
      return
    end

    charge.update!(response_data: params.as_json)

    if params[:sign] != signature(charge, params[:state_pol])
      update_status(charge, params[:state_pol])
      update_payment_method(charge, params[:payment_method_type])
      head :ok
    else
      head :unprocessable_entity
    end
  end

  private

  def signature(charge, state)
    msg = "#{ENV["PAYU_API_KEY"]}~#{ENV["PAYU_MERCHANT_ID"]}~#{charge.uid}~#{charge.amount}~COP~#{state}"
    Digest::MD5.hexdigest(msg)
  end

  def update_status(charge, status)
    if status == '4'
      charge.paid!
    elsif status == '7'
      charge.pending!
    elsif status == '6'
      charge.rejected!
      charge.update(error_message: params[:response_message_pol])
    end
  end

  def update_payment_method(charge, payment_method)
    if payment_method == '2'
      charge.credit_card!
    elsif payment_method == '4'
      charge.pse!
    elsif payment_method == '6'
      charge.debit_card!
    elsif payment_method == '7'
      charge.cash!
    elsif payment_method == '8' || payment_method == '10'
      charge.referenced!
    elsif payment_method == '14'
      charge.transfer!
    end
  end
end
