# Use Service.call(params) instead of Service.new(params).call
class ApplicationService
  def self.call(*args, &block)
    new(*args, &block).call
  end
end