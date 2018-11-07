with Framework;
with Gnoga.Application.Multi_Connect;
with Gnoga.Gui.View.Docker;
with Gnoga.Gui.Base;
with Gnoga.Gui.Element.Common;
with Gnoga.Gui.View.Card;
with Gnoga.Gui.Window;
--with Gnoga.Types;
with Main_Lib;
with Table;

package Dock is

   Failed                        : exception;

   type Connection_Data_Type is new Framework.Connection_Data_Type with record
      Cards                      : aliased Gnoga.Gui.View.Card.Card_View_Type;
      -- can contain one or more cards that one of which can be selected by a tab
      Deck                       : aliased Gnoga.Gui.View.Docker.Docker_View_Type;
      -- contains the Tabs, Table and Cards. The Tabs are always visible and are used
      -- The Table is always visible
      -- to select which Card nested under Cards is visible
      Dock                       : aliased Gnoga.Gui.View.Docker.Docker_View_Type;
      Docker                     : Gnoga.Gui.View.Docker.Docker_View_Type;
      -- is the view for the applications main window
      -- Panel and Deck are docked to it
      Exit_Button                : Gnoga.Gui.Element.Common.Button_Type;
      Exit_Occured               : Main_Lib.Signal_Type (One_Time => True);
      Panel                      : aliased Gnoga.Gui.View.View_Type;
      -- contains buttons that apply to all contexts
      -- it is nested directly under the top level Docker
      -- always includes exit, trace, help
      -- drived types can add buttons with Add_Pannel_Button
      Table                      : aliased Standard.Table.View_Type;
      -- is the permenent view of the main window
      Tabs                       : aliased Gnoga.Gui.View.Card.Tab_Type;
      -- are used to select which card is visible
   end record;

   type Connection_Data_Class_Access
                                 is access all Connection_Data_Type'class;

   procedure Add_Card (
      Connection_Data            : in out Connection_Data_Type;
      Tab_Title                  : in     String;
      Card                       : access Gnoga.Gui.View.View_Type'class;
      Select_Card                : in     Boolean);

   overriding
   procedure Connection_Handler (             -- handle new connection from browser
      Connection_Data            : in out Connection_Data_Type;
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class);

   procedure On_Connect (
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class;
      Connection                 : access Gnoga.Application.Multi_Connect.Connection_Holder_Type);

   procedure On_Exit (
      Object                     : in out Gnoga.Gui.Base.Base_Type'Class);

   Connection_ID                 : constant String := "dock";
   Debug                         : Boolean := False;

end Dock;
