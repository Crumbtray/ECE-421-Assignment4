require 'rubygems'
require 'gtk2'

class ConnectFourUI
  attr :glade

  def initialize(connectFourGame)
    @gameInstance = connectFourGame
    Gtk.init
    @builder = Gtk::Builder::new
    @builder.add_from_file("connect4.glade")
    @builder.connect_signals{ |handler| method(handler) }  # (I don't have any handlers yet, but I will have eventually)

    window1 = @builder.get_object("window1")
    window1.signal_connect( "destroy" ) { Gtk.main_quit }

    menu = @builder.get_object("imagemenuitem5")
    menu.signal_connect( "activate" ) { Gtk.main_quit }

    1.upto(7) { |i| 
        @builder.get_object("button" + i.to_s).signal_connect("clicked") {button_clicked(i)};
    }

    image1 = @builder.get_object("image1")

    window1.show()

    Gtk.main()
  end
  
  def button_clicked(tileNumber)
      puts "Button Pressed: #{tileNumber}"
      result = @gameInstance.move("Player 1", tileNumber)
      puts "FINAL RESULT = #{result}"
      @builder.get_object("image" + result.to_s).set_file("ghost.png")
  end
end