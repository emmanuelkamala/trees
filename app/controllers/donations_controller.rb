class DonationsController < ApplicationController
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
    @donation = Donation.new(donation_params)

    if @donation.save
      redirect_to donation_url(@donation), notice: "Donation was successfully created."
    else
      render :new, status: :unprocessable_entity 
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
      params.require(:donation).permit(:name, :amount, :email, :description)
    end
end
