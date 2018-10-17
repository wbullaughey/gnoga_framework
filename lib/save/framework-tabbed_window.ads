with Ada.Containers.Indefinite_Hashed_Maps;
with Ada.Strings.Hash;
with Ada.Task_Identification;
with Gnoga.Application.Multi_Connect;
with Gnoga.Gui.View;
with Gnoga.GUI.Window;
with Gnoga.Types;

package Framework.Tabbed_Window is

   package Types is

      type Connection_Type is new Framework.Types.Connection_Type with null record;
      type Widget_Type is new Gnoga.Gui.View.View_Type with private;

   private
      type Widget_Type is new Framework.Types.Connection_Type with record
         Ok_Button
      end record;

   end Types;

   procedure Connection_Handler (             -- handle new connection from browser
      Main_Window    : in out Gnoga.Gui.Window.Window_Type'Class;
      Connection     : access Gnoga.Application.Multi_Connect.Connection_Holder_Type);

   package Tabbed_Window_Framewor is new Skeleton (
         Abstract_Connection_Type   => Connection_Type,
         Connection_Handler         => Connection_Handler,
         Title                      => "main window");


end Framework.Tabbed_Window;


