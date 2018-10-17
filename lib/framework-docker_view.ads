with Gnoga.Gui.View.Docker;
with Gnoga.Gui.Base;
with Gnoga.Gui.View.Card;
--with Gnoga.Types;

package Framework.Docker_View is

   type View_Type is new Framework.View_Type with record
      Cards             : aliased Gnoga.Gui.View.Card.Card_View_Type;
      Deck              : aliased Gnoga.Gui.View.Docker.Docker_View_Type;
      --  Deck will dock a set of tabs at the top and the
      --  remainder will a card view Cards
      Docker            : Gnoga.Gui.View.Docker.Docker_View_Type;
      --  Main view, will dock a view on top (Panel) for the
      --  exit button and another taking up the rest of the window
      --  with another Docker (Deck)
      Panel             : aliased Gnoga.Gui.View.View_Type ;
      Tabs              : aliased Gnoga.Gui.View.Card.Tab_Type;
   end record;

   procedure Add_Card (
      View                       : in out View_Type;
      Card                       : access Framework.View_Type;
      Name                       : in     String)
   with pre => Card /= Null;

   overriding
   procedure Create (
      View                       : in out View_Type;
      Parent                     : in out Gnoga.Gui.Base.Base_Type'Class;
      ID                         : in     String  := "");

end Framework.Docker_View;
