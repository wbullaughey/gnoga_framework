with Framework;
with Gnoga.Application.Multi_Connect;
with Gnoga.Gui.View.Docker;
with Gnoga.Gui.View.Card;
with Gnoga.GUI.Window;
--with Gnoga.Types;

package Tabbed_Window_Framework is


   procedure Connection_Handler (             -- handle new connection from browser
      Main_Window    : in out Gnoga.Gui.Window.Window_Type'Class;
      Connection     : access Gnoga.Application.Multi_Connect.Connection_Holder_Type);

   type Connection_Type          is new Framework.Connection_Type with private;
   type Connection_Class_Access  is access all Connection_Type'class;
   type Widget_Type              is new Framework.Widget_Type with private;
   type Widget_Class_Access      is access all Widget_Type'class;

private
   type Widget_Type is new Framework.Widget_Type with record
      Cards                      : aliased Gnoga.Gui.View.Card.Card_View_Type;
      Deck                       : aliased Gnoga.Gui.View.Docker.Docker_View_Type;
      --  Deck will dock a set of tabs at the top and the
      --  remainder will a card view Cards
      Docker                     : Gnoga.Gui.View.Docker.Docker_View_Type;
      --  Main view, will dock a view on top (Panel) for the
      --  exit button and another taking up the rest of the window
      --  with another Docker (Deck)
      Panel                      : aliased Gnoga.Gui.View.View_Type ;
      Tabs                       : aliased Gnoga.Gui.View.Card.Tab_Type;
   end record;

   type Connection_Type          is new Framework.Connection_Type with record
      Widget                     : Widget_Type;
   end record;

end Tabbed_Window_Framework;


