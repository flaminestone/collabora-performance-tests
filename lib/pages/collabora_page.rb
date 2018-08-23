require_relative './../../lib/manager'
class CollaboraPage
  def initialize; end

  def write_text(instance)
    @instance = instance
    500.times do |i|
      puts "#{Time.now} ------- #{i} of 500"
      @instance.send_keys('', '1234567890')
      sleep 2
    end
  end

  def scrolling(instance)
    @instance = instance
    @instance.send_keys('', :page_down)
    70.times do |iteration|
      10.times do |i|
        puts "#{Time.now} -------PAGE_DOWN #{i} of 10"
        @instance.send_keys('', :page_down)
        sleep 0.5
      end
      10.times do |i|
        puts "#{Time.now} -------PAGE_UP #{i} of 10"
        @instance.send_keys('', :page_up)
        sleep 0.5
      end
      puts "++++++++++++++ITERATION #{iteration}"
    end
  end

  def wait_until_editor_open(instance)
    @instance = instance
    puts 'Wait until editor_open'
    size = 0
    timeout = 30
    until size > 300000 || @timeout == 0
      p "wait for editod is opened. Iteration #{@timeout}"
      @instance.select_frame('//*[@id="richdocumentsframe"]', 1)
      @instance.select_frame('//*[@id="loleafletframe"]', 1)
      @instance.select_frame('//*[@id="loleafletframe"]', 1)
      page = @instance.get_page_source
      size = page.size
      sleep 1
      timeout -= 1
    end
    puts 'Editor is opened'
  end
end
