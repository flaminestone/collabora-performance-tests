require_relative './../../lib/manager'
class CollaboraPage
  def initialize; end

  def write_text(instance)
    @instance = instance
    100.times do
      @instance.send_keys('1 2 3 4 5 6 7 8 9 0', '1 2 3 4 5 6 7 8 9 0')
      sleep 3
    end
  end
end
