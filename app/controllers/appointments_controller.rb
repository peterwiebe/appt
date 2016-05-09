class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
    @buttonText = "Make Appointment"
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.client = current_user

    if @appointment.save
      flash[:notice] = "Appointment has been created."
      redirect_to @appointment
    else
      flash.now[:alert] = "Appointment has not been created."
      render "new"
    end
  end

  def show
  end

  def edit
    @buttonText = "Update Appointment"
  end

  def update

    if @appointment.update(appointment_params)
      flash[:notice] = "Appointment has been updated."
      redirect_to @appointment
    else
      flash.now[:alert] = "Appointment has not been updated."
      render "edit"
    end
  end

  def destroy
    @appointment.destroy

    flash[:notice] = "Appointment has been cancelled."
    redirect_to appointments_path
  end

  private
    def appointment_params
      params.require(:appointment).permit(:date, :time)
    end

    def set_appointment
      @appointment = Appointment.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The appointment you were looking for could not be found."
      redirect_to appointments_path
    end
end
