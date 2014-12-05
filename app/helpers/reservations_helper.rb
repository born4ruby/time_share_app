module ReservationsHelper

	def build_amenities_checkboxes(f)
		html = ''
		Reservation::AMENITIES.each do |amenity|
			html += '<div class="checkbox">'
			html += f.check_box :amenities, {:multiple => true}, amenity, nil
			html += f.label amenity
			html += '</div>'
		end	
		return html
	end

end