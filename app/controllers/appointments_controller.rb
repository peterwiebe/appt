class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
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
      flash.now[:alert] = "Appointment has not been created."
      render "new"
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])

    if @appointment.update(appointment_params)
      flash[:notice] = "Appointment has been updated."
      redirect_to @appointment
    else
      flash.now[:alert] = "Appointment has not been updated."
      render "edit"
    end
  end

  private
    def appointment_params
      params.require(:appointment).permit(:date, :time)
    end
end
