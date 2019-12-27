class Invest < ApplicationRecord

	validates :amount, presence: true

	def self.calculate_current_amount(amounts, combine_date)
		todays_date = Time.now
		if(combine_date > todays_date && combine_date < "2019-04-01")
			[true, "Please select Date between 2019-04-01 to Current Date"]
		else
			selected_data_record = NavDatum.find_by("current_date = ?", combine_date)
			if selected_data_record.nil?
				[true, "Selected dates record is not present."]
			else
				todays_date = "#{todays_date.year}-#{todays_date.month}-#{todays_date.day}"
				current_date_record = NavDatum.find_by("current_date = ?", todays_date)
				previous_units = amounts.to_f / selected_data_record.net_asset_value.to_f
				if current_date_record.nil?
					last_record = NavDatum.order("created_at").last
					current_investment = previous_units.to_f * last_record.net_asset_value.to_f
					[false, "Your Current is #{current_investment} on this #{last_record.current_date} Date which is last record"]
				else
					current_investment = previous_units.to_f * current_date_record.net_asset_value.to_f
					[false, "Your Current is #{current_investment} on this #{current_date_record.current_date} Date"]
				end
			end
		end
	end

end

