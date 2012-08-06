module IpUtils
	
	def IpUtils.ip_to_binary(ip)
		binary_ip = ''
		ip.split('.').each do |x|
			binary_ip += sprintf("%0.8B", x)
		end
	return binary_ip
	end
	
	def IpUtils.binary_to_ip(binary_ip)
		one = binary_ip[0..7]
		two = binary_ip[8..15]
		three = binary_ip[16..23]
		four = binary_ip[24..31]
		ip = one.to_i(2).to_s + '.' + two.to_i(2).to_s + '.' + three.to_i(2).to_s + '.' + four.to_i(2).to_s
		return ip
	end
	
	def IpUtils.next_ip(ip)
		binary_ip = IpUtils.ip_to_binary(ip)
		next_ip_as_number = binary_ip.to_i(2) + 1
		next_binary_ip = sprintf("%0.32B", next_ip_as_number)
		return IpUtils.binary_to_ip(next_binary_ip)
	end
end
