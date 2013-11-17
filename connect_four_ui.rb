require 'gtk2'

class ConnectFourUI
  def initialize(connectFourGame)
    @gameInstance = connectFourGame
    Gtk.init
    
    button1 = Gtk::Button.new("1")
    button1.signal_connect("clicked") {
      connectFourGame.move(1)
    }
    
    window = Gtk::Window.new
    window.signal_connect("destroy") {
      puts "Destroy event occurred"
      Gtk.main_quit
    }
    window.border_width = 10
    window.add(button1)
    window.show_all
    Gtk.main
  end
  
  
  
end