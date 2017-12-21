require 'serialport' # use Kernel::require on windows, works better.
require "sinatra"

sp = SerialPort.new("/dev/ttyACM0",9600, 8, 1, SerialPort::NONE)

durum = true
get '/' do
  if durum
    redirect '/off'
  else
    redirect '/on'
  end
end

get '/off' do
  sp.write(0)
  '<body style="background-color: red; width:100%;">Durum Kapalı açmak için <a href="/on"> tıklayın.</a></body>'
end

get '/on' do
  sp.write(1)
  '<body style="background-color: green; width:100%;">Durum Açık Kapatmak için <a href="/off"> tıklayın.</a></body>'
end
