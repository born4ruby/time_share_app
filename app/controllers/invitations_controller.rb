class InvitationsController < ApplicationController

  def new
  	@invitation = Invitation.new
  end

  def create
  	@invitation = Invitation.new(invitation_params)
  	@invitation.generate_invitation_token

    respond_to do |format|
      if @invitation.save
        format.html { redirect_to root_path, notice: "Thank you! We've emailed you an activation link. Follow the link to make reservation." }
      else
        format.html { render :new }
      end
    end
  end

  private

    def invitation_params
      params.require(:invitation).permit(:user_email)
    end

end
