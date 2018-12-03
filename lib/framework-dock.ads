--with Framework;
--with Gnoga.Application.Multi_Connect;
with Gnoga.Gui.View.Docker;
with Gnoga.Gui.Base;
with Gnoga.Gui.Element.Common;
with Gnoga.Gui.View.Card;
with Gnoga.Gui.View.Console;
with Gnoga.Gui.Window;
--with Gnoga.Types;
with Framework.Library;
--with Framework.Table;

package Framework.Dock is

   Failed                        : exception;

   type Connection_Data_Type is new Framework.Connection_Data_Type with private;

   type Connection_Data_Class_Access
                                 is access all Connection_Data_Type'class;

   -- called from the Dock Connection_Handler when Tabs and Cards can be added
   procedure Application_Initialization (
      Connection_Data            : in out Connection_Data_Type;
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class);

   generic

      type Connection_Data_Type_Parameter
                                    is tagged limited private;

   package Dock_Framework is

      subtype Generic_Connection_Data_Type
                                 is Connection_Data_Type_Parameter;
      type Dock_Type             is new Gnoga.Gui.View.Docker.Docker_View_Type with private;

      -- can be called by Application_Initialization
      procedure Add_Button (
         Connection_Data            : in out Generic_Connection_Data_Type;
         Label                      : in     String;
         On_Click_Handler           : in     Gnoga.Gui.Base.Action_Event);

      -- the first call must be made in the Application_Initialization routine
      -- calls outside of Application_Initialization must come after call to Run
      -- otherwise the hight of the tab section does not get set
      -- adds a Tab/Card pair
      -- Create is called for the Card
      procedure Add_Card (
         Connection_Data            : in out Generic_Connection_Data_Type;
         Tab_Title                  : in     String;
         Card                       : access Gnoga.Gui.View.View_Type'class;
         Select_Card                : in     Boolean;
         Card_ID                    : in     String := "")
      with pre => Card /= Null;

      -- tests if the automatic Exit button has been selected
      function Did_Exit (
         Connection_Data            : in out Generic_Connection_Data_Type
      ) return Boolean;

      function Find_Card (
         Connection_Data            : in     Generic_Connection_Data_Type;
         ID                         : in     String
      ) return Gnoga.Gui.Element.Pointer_To_Element_Class;

      -- waits for the automatic Exit button to be selected
      procedure Wait_For_Exit (
         Connection_Data            : in out Generic_Connection_Data_Type);

      -- waits for the Connection_Handler to complete
      procedure Wait_For_Initialization (
         Connection_Data            : in     Generic_Connection_Data_Type);

      procedure Initialize_Dock (
         Connection_Data            : in out Generic_Connection_Data_Type;
         Title                      : in     String;
         HTTP_Port                  : in     Positive := 8080);

   private

      type Dock_Type                is new Gnoga.Gui.View.Docker.Docker_View_Type with record
         Connection_Data            : Generic_Connection_Data_Type;
      end record;

      procedure On_Exit (
         Object                     : in out Gnoga.Gui.Base.Base_Type'Class);

   end Dock_Framework;

   -- starts te message loop
   -- waits for the dock to get initialized
   overriding
   procedure Run (
      Connection                 : in out Connection_Data_Type);

-- Connection_ID                 : constant String := "dock";
   Debug                         : Boolean := False;

private

   overriding
   procedure Connection_Handler (             -- handle new connection from browser
      Connection_Data            : in out Connection_Data_Type;
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class);

   type Connection_Data_Type is new Framework.Connection_Data_Type with record
      Cards                      : aliased Gnoga.Gui.View.Card.Card_View_Type;
      -- can contain one or more cards that one of which can be selected by a tab
      Deck                       : aliased Gnoga.Gui.View.Docker.Docker_View_Type;
      -- contains the Tabs, Table and Cards. The Tabs are always visible and are used
      -- The Table is always visible
      -- to select which Card nested under Cards is visible
      Dock_Initialized           : Boolean := False;
      Docker                     : Gnoga.Gui.View.Docker.Docker_View_Type;
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

end Framework.Dock;
