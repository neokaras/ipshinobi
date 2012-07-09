#!/opt/local/bin/ruby1.9

$:.unshift('../lib')
require 'ip'
require 'ip_utils'

ip1 = Ip.new('127.0.0.2')
ip2 = Ip.new('127.0.0.3')
ip3 = Ip.new('127.86.107.30')

ip1.tag = 'dns server'
ip3.tag = 'test'

puts "Ip1 is #{ip1.ip} and tagged as #{ip1.tag}"
puts "Ip2 is #{ip2.ip} and tagged as #{ip2.tag}"
puts "Ip3 is #{ip3.ip} and tagged as #{ip3.tag}"

puts "Ip1 in binary is #{IpUtils.ip_to_binary(ip1.ip)}"
puts "Ip3 in binary is #{IpUtils.ip_to_binary(ip3.ip)}"

ip_binary = IpUtils.ip_to_binary(ip3.ip)
ip = IpUtils.binary_to_ip(ip_binary)
puts "back to ip: #{ip}"
