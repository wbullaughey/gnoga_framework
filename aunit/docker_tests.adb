with Ada.Calendar;
with Ada.Text_IO;use Ada.Text_IO;
with Aunit.Assertions; use Aunit.Assertions;
with CAC.Trace.Tasks; use CAC.Trace;
with CAC.Unit_Test.Setup;
with Dock.Helper;
--with Gnoga.Gui.Base;
--with Gnoga.Gui.Element;
with options;

package body Docker_Tests is

   use type Ada.Calendar.Time;

-- procedure Create_Handler (
--    Object                     : in out Gnoga.Gui.Base.Base_Type'Class);
--
-- procedure Ok_Handler (
--    Object                     : in out Gnoga.Gui.Base.Base_Type'Class);
--
-- Connection_ID                 : constant String := "root";

   ---------------------------------------------------------------
   overriding
   procedure Connection_Handler (             -- handle new connection from browser
      Connection_Data            : in out Connection_Data_Type;
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class) is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");
      Dock.Connection_Data_Type (Connection_Data).Connection_Handler(Main_Window);
      Connection_Data.Created := True;
      Log (Debug, Here, Who & " exit");
   end Connection_Handler;

-- ---------------------------------------------------------------
-- procedure Create_Handler (
--    Object                     : in out Gnoga.Gui.Base.Base_Type'Class) is
-- ---------------------------------------------------------------
--
--    Connection_Data            : constant Connection_Class_Access :=
--                                  Connection_Class_Access (Framework.Get_Connection (Connection_ID));
-- begin
--    Log (Debug, Here, Who & " enter");
--    Connection_Data.Object := Object'unchecked_access;
-- end Create_Handler;
--
-- ---------------------------------------------------------------
-- procedure Ok_Handler (
--    Object                     : in out Gnoga.Gui.Base.Base_Type'Class) is
-- ---------------------------------------------------------------
--
--    Connection_Data            : constant Connection_Class_Access :=
--                                  Connection_Class_Access (Object.Connection_Data);
--
-- begin
--    Log (Debug, Here, Who & " enter");
--    Connection_Data.Ok_Button.Disabled;
--    Connection_Data.Ok_Pressed := True;
--    Log (Debug, Here, Who & " exit");
-- end Ok_Handler;

   ---------------------------------------------------------------
   procedure Set_Up (T : in out Test_Type) is
   ---------------------------------------------------------------
   begin
      Log (Debug, Here, Who & " enter");
      T.Connection.Test := T'unchecked_access;
      Dock.Helper.Initialize (T.Connection);
      T.Connection.Initialize (Dock.Connection_ID, Dock.On_Connect'access, "docker test title");
      Log (Debug, Here, Who & " exit");

   exception
      when Fault: others =>
         CAC.Unit_Test.Setup.Set_Up_Exception (Fault, Here, Who);
   end Set_Up;

   ---------------------------------------------------------------
   procedure Tear_Down (T : in out Test_Type) is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");
      T.Connection.Exit_Occured.Wait;
      T.Connection.Stop;
      Log (Debug, Here, Who & " exit");
   end Tear_Down;

   ---------------------------------------------------------------
   procedure Test_Docker (
      T                          : in out Test_Type) is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");
      T.Connection.Run;

      if Options.Pause then
         Pause ("before teardown");
      end if;

      declare
         Mouse_Clicked           : Boolean := False;
         Timeout                 : constant Ada.Calendar.Time := Ada.Calendar.Clock + 2.0;

      begin
log (here, who);
         while Ada.Calendar.Clock < Timeout loop
            if T.Connection.Created then
               if Options.Manual then
log (here, who);
                  Put_Line ("click the exit button");
                  T.Connection.Exit_Occured.Wait;     -- will wait forever for exit click
                  Log (Debug, Here, Who & " exit succeed");
                  return;
               end if;

               if T.Connection.Exit_Occured.Test then
                  Log (Debug, Here, Who & " exit succeed");
                  return;
               end if;

               if not (Options.Pause or Mouse_Clicked) then
                  Log (Debug, Here, Who & " simulate mouse click");
                  Dock.Helper.Press_Exit (T.Connection.Object);
                  Mouse_Clicked := True;
               end if;

            end if;
            delay 0.1;
         end loop;
      end;

      Assert (False, "Created should be set");
      Assert (False, "Ok should have been pressed");
      Log (Debug, Here, Who & " exit failure");

   exception
      when Fault: others =>
         Trace_Exception (Fault, Here, Who);

   end Test_Docker;

end Docker_Tests;
