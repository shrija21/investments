require 'net/http'
require 'net/https'
require 'time'

todays_date = Date.today
todays_date  = "#{todays_date.day}-#{Date::MONTHNAMES[todays_date.month].slice(0,3)}-#{todays_date.year}"
url = "http://portal.amfiindia.com/DownloadNAVHistoryReport_Po.aspx?mf=53&tp=1&frmdt=01-Apr-2015&todt=#{todays_date}"
data = Net::HTTP.get(URI(url))
data = data.split('Open Ended Schemes')

data.each do |d|
	if d.include?(' ( Equity Scheme - ELSS')
		data = d
		break
	end
end

data = data.split("\n")
NavDatum.destroy_all

data.each do |d|
	split_data = d.gsub(/\r/, '').split(";")
	p split_data[7]
	if (split_data[0] =~ /^[0-9]*$/)
		NavDatum.create(:scheme_code => split_data[0],
						:scheme_name => split_data[1], 
						:ISIN_growth => split_data[2], 
						:ISIN_div_reinvestment => split_data[3],
						:net_asset_value => split_data[4].to_f,
						:repurchase_price => split_data[5].to_f,
						:sale_price => split_data[6].to_f,
						:current_date => split_data[7])
	end
end

p "Created #{NavDatum.count} NavDatum records"