class DonationsController < ApplicationController
  #skip_before_action :verify_authenticity_token, only: [:callback]
  before_action :set_donation, only: %i[ show edit update destroy ]

  def index
    @donations = Donation.all
  end

  def show
  end

  def new
    @donation = Donation.new
  end

  def edit
  end

  def create
    #@donation = Donation.new(donation_params)

    @donation = Donation.create donation_params
    flash[:success] = "Thanks for your donation of #{ sprintf("%.2f", @donation.amount)} euro!"
    payment = Mollie::Payment.create(
      amount:       { value: sprintf("%.2f", @donation.amount), currency: 'EUR' },
      description:  'Donation for the Greenmanjaro project',
      redirect_url: "https://thestacklounge.co.uk/about",
      webhook_url:  "https://thestacklounge.co.uk/donations/callback"
    )
    donation.payments.create(amount: @donation.amount, donation_id: donation.id, identifier: payment.id)
    redirect_to payment.checkout_url
  end

  def callback
    unless params[:testByMollie]
      id = params[:id]
      payment = Mollie::Payment.get(id)
      if payment.paid?
        pay = Payment.find_by_identifier id
        @donation = pay.donation
        @donation.has_been_paid(pay)
      end
    end
  end


  def update
    if @donation.update(donation_params)
      redirect_to donation_url(@donation), notice: "Donation was successfully updated." 
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  def destroy
    @donation.destroy
     redirect_to donations_url, notice: "Donation was successfully destroyed." 
  end

  private
    def set_donation
      @donation = Donation.find(params[:id])
    end

    def donation_params
      #binding.pry
      params.require(:donation).permit(:name, :amount, :email, :description)
    end
end
