--with Framework;
--with Gnoga.Application.Multi_Connect;
--with Gnoga.Gui.View.Docker;
with Gnoga.Gui.Base;
--with Gnoga.Gui.Element.Common;
with Gnoga.Gui.View.Card;
--with Gnoga.Gui.View.Console;
with Gnoga.Gui.Window;
--with Gnoga.Types;
with Framework.Dock_Base;
--with Framework.Library;

generic

   type Connection_Data_Type (<>)
                                 is new Dock_Base.Base_Connection_Data_Type with private;

package Framework.Dock is
   type Dock_Connection_Data_Type
                                 is new Connection_Data_Type with private;

   -- can be called by Application_Initialization
   overriding
   procedure Add_Button (
      Connection_Data            : in out Dock_Connection_Data_Type;
      Label                      : in     String;
      On_Click_Handler           : in     Gnoga.Gui.Base.Action_Event);

   -- the first call must be made in the Application_Initialization routine
   -- calls outside of Application_Initialization must come after call to Run
   -- otherwise the hight of the tab section does not get set
   -- adds a Tab/Card pair
   -- Create is called for the Card
   overriding
   procedure Add_Card (
      Connection_Data            : in out Dock_Connection_Data_Type;
      Tab_Title                  : in     String;
      Card                       : access Gnoga.Gui.View.View_Base_Type'class;
      Select_Card                : in     Boolean)
--    Card_ID                    : in     String := "")
   with pre => Card /= Null;

   overriding
   procedure Connection_Handler (             -- handle new connection from browser
      Connection_Data            : in out Dock_Connection_Data_Type;
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class);

   -- tests if the automatic Exit button has been selected
   function Did_Exit (
      Connection_Data            : in out Dock_Connection_Data_Type
   ) return Boolean;

   overriding
   function Find_Card (
      Connection_Data            : in     Dock_Connection_Data_Type;
      ID                         : in     String
   ) return Gnoga.Gui.View.Pointer_To_View_Base_Class;

   procedure Initialize_Dock (
      Connection_Data            : in out Dock_Connection_Data_Type;
      Title                      : in     String;
      HTTP_Port                  : in     Positive := 8080);

   overriding
   function Parent (
      Connection_Data            : in out Dock_Connection_Data_Type
   ) return Gnoga.Gui.View.Card.Pointer_To_Card_View_Class;

   -- waits for the automatic Exit button to be selected
   procedure Wait_For_Exit (
      Connection_Data            : in out Dock_Connection_Data_Type);

   -- waits for the Connection_Handler to complete
   procedure Wait_For_Initialization (
      Connection_Data            : in     Dock_Connection_Data_Type);

   -- starts te message loop
   -- waits for the dock to get initialized
   overriding
   procedure Run (
      Connection                 : in out Dock_Connection_Data_Type);

private

      procedure On_Exit (
         Object                  : in out Gnoga.Gui.Base.Base_Type'Class);

   type Dock_Connection_Data_Type is new Connection_Data_Type with null record;
-- end record;

end Framework.Dock;
