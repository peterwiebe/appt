class AppointmentsController < ApplicationController
  def index
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      flash[:notice] = "Appointment has been created."
      redirect_to @appointment
    else
      #nothing yet
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  private
    def appointment_params
      params.require(:appointment).permit(:date, :time)
    end
end
