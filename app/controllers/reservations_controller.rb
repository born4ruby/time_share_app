class ReservationsController < ApplicationController
  before_action :set_invitation

  def new
  	unless @invitation.reservation_completed
  	  session[:reservation_params] ||= {}
      @reservation = @invitation.build_reservation(session[:reservation_params])
      @reservation.current_step = session[:reservation_step]
    end
  end

  def create
  	session[:reservation_params].deep_merge!(reservation_params) if reservation_params
    @reservation = @invitation.build_reservation(session[:reservation_params])
    @reservation.current_step = session[:reservation_step]
    if @reservation.valid?
      if params[:back_button]
        @reservation.previous_step
      elsif @reservation.last_step?
      	# set ip_address
      	@reservation.set_ip_address(request)
        @reservation.save
        @invitation.set_reservation_completed
        ReservationMailer.reservation_completion_email(@reservation).deliver
      else
        @reservation.next_step
      end
      session[:reservation_step] = @reservation.current_step
    end
    if @reservation.new_record?
      render "new"
    else
      session[:reservation_step] = session[:reservation_params] = nil
      flash[:notice] = "Reservation scheduled!"
      redirect_to root_path
    end
  end

  private

    def reservation_params
      params.require(:reservation).permit(:first_name, :last_name, :phone_number,
      	                                  :preferred_housing_date, :additional_questions, :amenities)
    end

    def set_invitation
      @invitation = Invitation.find(params[:token])
    end

end
