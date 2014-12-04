class Reservation < ActiveRecord::Base

  attr_writer :current_step

  # Associations
  belongs_to :invitation

  def steps
    %w[personal additional]
  end

  def current_step
    @current_step || steps.first
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end

  def first_step
    steps.first
  end

  def first_step?
    current_step == first_step
  end

  def last_step?
    current_step == steps.last
  end

  def set_ip_address(request)
  	self.ip_address = request.remote_ip
  end

end
