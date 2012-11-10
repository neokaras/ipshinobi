require 'builder'

class IpTabletStore
	def initialize(ip_tablet)
		@ip_tablet = ip_tablet
	end

	def store_tablet_as_xml
		test_file = File.new("example2_xml.txt", "w")

		xml = Builder::XmlMarkup.new(:target => test_file, :indent => 3)

		xml.instruct!
		xml.ip_tablet do

		for ip in @ip_tablet.tablet_ips do
			xml.ip_obj do
				xml.ip ip.ip
				xml.tag ip.tag
				ip.ip_attr.each_pair do |k, v|
					str = "xml.#{k} #{v}"
					eval(str)
				end
			end 
		end
	end
	end
end
