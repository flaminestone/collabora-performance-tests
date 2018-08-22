require_relative './../../lib/manager'
class CollaboraPage
  def initialize; end

  def write_text(instance)
    @instance = instance
    500.times do |i|
      puts "#{Time.now} ------- #{i}"
      @instance.send_keys('', '1234567890')
      sleep 2
    end
  end
end
