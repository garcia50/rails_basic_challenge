class AddressesController < ApplicationController

  def new 
    @address = Address.new    
  end

  def create
    @student = Student.find(params[:student_id])
    @address = @student.address.create(address_params)
    if @address.save
      redirect_to address_path(@address)
    else
      render :new
    end
  end

  

  private

  def address_params
    params.require(:address).permit(:street, :city, :state, :zip)
  end

end