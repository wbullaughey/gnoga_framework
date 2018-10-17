with CAC.Trace; use CAC.Trace;
--with Framework.Docker_View;
with Gnoga.Application.Multi_Connect;
--with Gnoga.Gui.Base;
--with Gnoga.Gui.Element.Common;
with Gnoga.Gui.Window;

package body Top_Window is

-- Connection                    : aliased Framework.Connection_Type;
   ID                            : constant String := "top";
   Title                         : constant String := "top title";

   procedure Exit_Button_Click_Handler (
      Object                     : in out Gnoga.Gui.Base.Base_Type'Class);

   procedure Application_Handler (
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class;
      Connection                 : access Gnoga.Application.Multi_Connect.Connection_Holder_Type);

   procedure Trace_Button_Click_Handler (
      Object               : in out Gnoga.Gui.Base.Base_Type'Class);

   ---------------------------------------------------------------
   procedure Create (
      Connection                 : in out Connection_Data_Type) is
   ---------------------------------------------------------------

   begin
      Framework.Create (Connection'unchecked_access, ID,
         Connection.View'unchecked_access, Application_Handler'access, Title);
   end Create;

   ---------------------------------------------------------------
   procedure Create (
      View                       : in out View_Type;
      Parent                     : in out Gnoga.Gui.Base.Base_Type'Class;
      ID                         : in     String  := "") is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");
      Framework.Docker_View.View_Type (View).Create (Parent, ID);

      View.Exit_Button.Create (View.Panel, "Exit");
      View.Exit_Button.On_Click_Handler (
         Exit_Button_Click_Handler'Access);

      View.Trace_Button.Create (View.Panel, "Trace");
      View.Trace_Button.On_Click_Handler (
         Trace_Button_Click_Handler'Access);

   end Create;
   ---------------------------------------------------------------
   procedure Exit_Button_Click_Handler (
      Object            : in out Gnoga.Gui.Base.Base_Type'Class) is
   ---------------------------------------------------------------

      Application_Data           : Connection_Data_Type renames
                                    Connection_Data_Type (Object.Connection_Data.all);
   begin
      Log (Debug, Here, Who & " enter");
      Application_Data.View.Exit_Button.Disabled;
      Application_Data.View.Panel.Put_Line ("Closing application");
      Gnoga.Application.Multi_Connect.End_Application;
      Log (Debug, Here, Who & " exit");
   end Exit_Button_Click_Handler;

   ---------------------------------------------------------------
   procedure Application_Handler (
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class;
      Connection                 : access Gnoga.Application.Multi_Connect.Connection_Holder_Type) is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");
   end Application_Handler;

-- ---------------------------------------------------------------
-- procedure Run is
-- ---------------------------------------------------------------
--
-- begin
--    Connection.Run;
-- end Run;

   ---------------------------------------------------------------
   procedure Trace_Button_Click_Handler (
      Object            : in out Gnoga.Gui.Base.Base_Type'Class) is
   ---------------------------------------------------------------


   begin
      pragma Unreferenced (Object);
      Debug := not Debug;
      Log (Debug, Here, Who);
   end Trace_Button_Click_Handler;

end Top_Window;
