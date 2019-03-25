with CAC.Trace; use CAC.Trace;

package body Framework.Dock_Base is

   ----------------------------------------------------------------------------
   procedure Add_Card (
      Connection_Data            : in out Base_Connection_Data_Type;
      Tab_Title                  : in     String;
      Card                       : access Gnoga.Gui.View.View_Base_Type'class;
      Select_Card                : in     Boolean) is
--    Card_ID                    : in     String := "") is
   pragma Unreferenced (Connection_Data, Tab_Title, Card, Select_Card);
   ----------------------------------------------------------------------------

   begin
      Log (Debug, Here, Who);
      raise Failed with Here & " " & Who & " must be overrident";
   end Add_Card;

   ----------------------------------------------------------------------------
   procedure Add_Button (
      Connection_Data            : in out Base_Connection_Data_Type;
      Label                      : in     String;
      On_Click_Handler           : in     Gnoga.Gui.Base.Action_Event) is
   ----------------------------------------------------------------------------

   begin
      Log (Debug, Here, Who);
      raise Failed with Here & " " & Who & " must be overrident";
   end Add_Button;

   ----------------------------------------------------------------------------
   procedure Application_Initialization (
      Connection_Data            : in out Base_Connection_Data_Type;
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class) is
   pragma Unreferenced (Connection_Data, Main_Window);
   ----------------------------------------------------------------------------

   begin
      Log (Debug, Here, Who);
      raise Failed with Here & " " & Who & " must be overrident";
   end Application_Initialization;

   ----------------------------------------------------------------------------
   overriding
   procedure Connection_Handler (             -- handle new connection from browser
      Connection_Data            : in out Base_Connection_Data_Type;
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class) is
   pragma Unreferenced (Connection_Data, Main_Window);
   ----------------------------------------------------------------------------

   begin
      raise Failed with Here & " " & Who & " must be overrident";
   end Connection_Handler;

   ----------------------------------------------------------------------------
   function Find_Card (
      Connection_Data            : in     Base_Connection_Data_Type;
      ID                         : in     String
   ) return Gnoga.Gui.View.Pointer_To_View_Base_Class is
   pragma Unreferenced (Connection_Data, ID);
   ----------------------------------------------------------------------------

   begin
      pragma Assert (False, Here & " " & Who & " must be overrident");
      return Null;
   end Find_Card;

   ----------------------------------------------------------------------------
   function Inner (
      Dock                       : in out Docker_Type
   ) return access Gnoga.Gui.View.Docker.Docker_View_Type'Class is
   ----------------------------------------------------------------------------

   begin
      return Dock'unchecked_access;
   end Inner;

   ----------------------------------------------------------------------------
   function Parent (
      Connection_Data            : in out Base_Connection_Data_Type
   ) return Gnoga.Gui.View.Card.Pointer_To_Card_View_Class is
   pragma Unreferenced (Connection_Data);
   ----------------------------------------------------------------------------

   begin
      Log (Debug, Here, Who);
      raise Failed with Here & " " & Who & " must be overrident";
      return Null;
   end Parent;

-- ----------------------------------------------------------------------------
-- procedure Top_Dock (
--    View                       : in out Docker_Type;
--    Dock                       : access Gnoga.Gui.View.View_Base_Type'Class) is
-- ----------------------------------------------------------------------------
--
-- begin
--    View.Top_Dock (Dock);
-- end Top_Dock;

end Framework.Dock_Base;
