require 'rspec'

class ApiConnector
  attr_accessor :attempts, :errors

  def initialize
    @attempts = 0
    @errors = []
  end

  def send_data
    begin
      @attempts += 1
      api_call
    rescue Errno::ETIMEDOUT => e
      @errors << e
      retry if @attempts < 3
    end
  end

  def api_call
    raise Errno::ETIMEDOUT
  end
end
