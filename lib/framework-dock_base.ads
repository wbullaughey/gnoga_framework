with Framework.Library;
with Gnoga.Gui.Base;
with Gnoga.Gui.View.Card;
with Gnoga.Gui.View.Console;
with Gnoga.Gui.Element.Common;
with Gnoga.Gui.View.Docker;
with Gnoga.Gui.Window;

package Framework.Dock_Base is

   type Dock_Type                is new Gnoga.Gui.View.Docker.Docker_View_Type with private;
   type Dock_Class_Access        is access all Dock_Type'class;

   type Base_Connection_Data_Type is abstract new Framework.Connection_Data_Type with record
      Cards                      : aliased Gnoga.Gui.View.Card.Card_View_Type;
      -- can contain one or more cards that one of which can be selected by a tab
      Deck                       : aliased Gnoga.Gui.View.Docker.Docker_View_Type;
      -- contains the Tabs, Table and Cards. The Tabs are always visible and are used
      -- The Table is always visible
      -- to select which Card nested under Cards is visible
      Dock                       : Dock_Class_Access := Null;
      Dock_Initialized           : Boolean := False;
      Docker                     : aliased Gnoga.Gui.View.Docker.Docker_View_Type;
      -- is the view for the applications main window
      -- Panel and Deck are docked to it
      Exit_Button                : Gnoga.Gui.Element.Common.Button_Type;
      Exit_Occured               : Framework.Library.Signal_Type (One_Time => True);
      Initial_Card               : aliased Gnoga.Gui.View.Console.Console_View_Type;
      Panel                      : aliased Gnoga.Gui.View.View_Type;
      -- contains buttons that apply to all contexts
      -- it is nested directly under the top level Docker
      -- always includes exit, trace, help
      -- drived types can add buttons with Add_Pannel_Button
--    Table                      : aliased Standard.Table.View_Type;
      -- is the permenent view of the main window
      Tabs                       : aliased Gnoga.Gui.View.Card.Tab_Type;
      -- are used to select which card is visible
   end record;

   -- the first call must be made in the Application_Initialization routine
   -- calls outside of Application_Initialization must come after call to Run
   -- otherwise the hight of the tab section does not get set
   -- adds a Tab/Card pair
   -- Create is called for the Card
   procedure Add_Card (             -- must be overriden by derived type
      Connection_Data            : in out Base_Connection_Data_Type;
      Tab_Title                  : in     String;
      Card                       : access Gnoga.Gui.View.View_Base_Type'class;
      Select_Card                : in     Boolean)
--    Card_ID                    : in     String := "")
   with pre => Card /= Null;

   procedure Add_Button (
      Connection_Data            : in out Base_Connection_Data_Type;
      Label                      : in     String;
      On_Click_Handler           : in     Gnoga.Gui.Base.Action_Event);

   -- called from the Dock Connection_Handler when Tabs and Cards can be added
   procedure Application_Initialization (
      Connection_Data            : in out Base_Connection_Data_Type;
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class);

   overriding
   procedure Connection_Handler (             -- handle new connection from browser
      Connection_Data            : in out Base_Connection_Data_Type;
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class);

-- procedure Create (
--    Dock                       : in out Dock_Type;
--    Parent                     : in out Gnoga.Gui.Base.Base_Type'Class;
--    ID                         : in     String  := "");

   function Find_Card (
      Connection_Data            : in     Base_Connection_Data_Type;
      ID                         : in     String
   ) return Gnoga.Gui.View.Pointer_To_View_Base_Class;

   function Inner (
      Dock                       : in out Dock_Type
   ) return access Gnoga.Gui.View.Docker.Docker_View_Type'Class;

   function Parent (
      Connection_Data            : in out Base_Connection_Data_Type
   ) return Gnoga.Gui.View.Card.Pointer_To_Card_View_Class;

-- procedure Top_Dock (
--    View                       : in out Dock_Type;
--    Dock                       : access Gnoga.Gui.View.View_Base_Type'Class);

private

   type Dock_Type                is new Gnoga.Gui.View.Docker.Docker_View_Type with null record;

end Framework.Dock_Base;
