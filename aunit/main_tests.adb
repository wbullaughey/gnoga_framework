with Ada.Calendar;
with Aunit.Assertions; use Aunit.Assertions;
with CAC.Trace.Tasks; use CAC.Trace;
with CAC.Unit_Test.Setup;
with Gnoga.Gui.Element;
with options;

package body Main_Tests is

   use type Ada.Calendar.Time;

   procedure Create_Handler (
      Object                     : in out Gnoga.Gui.Base.Base_Type'Class);

   procedure Ok_Handler (
      Object                     : in out Gnoga.Gui.Base.Base_Type'Class);

   ---------------------------------------------------------------
   overriding
   procedure Connection_Handler (             -- handle new connection from browser
      Connection_Data            : in out Connection_Data_Type;
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class) is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");
      Connection_Data.Form.Create (Main_Window);
      Connection_Data.Ok_Button.On_Create_Handler (Create_Handler'Unrestricted_Access);
      Connection_Data.Ok_Button.Create (Connection_Data.Form, "OK", "Ok", "Ok");
      Connection_Data.Ok_Button.On_Click_Handler (Ok_Handler'Unrestricted_Access);
      Connection_Data.Test.Created := True;
      Log (Debug, Here, Who & " exit");
   end Connection_Handler;

   ---------------------------------------------------------------
   procedure Create_Handler (
      Object                     : in out Gnoga.Gui.Base.Base_Type'Class) is
   ---------------------------------------------------------------

      Connection_Data            : constant Connection_Data_Class_Access :=
                                    Connection_Data_Class_Access (Framework.Get_Connection);
   begin
      Log (Debug, Here, Who & " enter");
      Connection_Data.Object := Object'unchecked_access;
   end Create_Handler;

   ---------------------------------------------------------------
   procedure Ok_Handler (
      Object                     : in out Gnoga.Gui.Base.Base_Type'Class) is
   ---------------------------------------------------------------

      Connection_Data            : constant Connection_Data_Class_Access :=
                                    Connection_Data_Class_Access (Object.Connection_Data);

   begin
      Log (Debug, Here, Who & " enter");
      Connection_Data.Ok_Button.Disabled;
      Connection_Data.Ok_Pressed := True;
      Log (Debug, Here, Who & " exit");
   end Ok_Handler;

   ---------------------------------------------------------------
   procedure Set_Up (T : in out Test_Type) is
   ---------------------------------------------------------------
   begin
      Log (Debug, Here, Who & " enter");
      T.Connection.Test := T'unchecked_access;
      T.Connection.Initialize ("main test title", Options.Port);
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
      T.Connection.Stop;

      if Options.Pause then
         Pause ("pause in Tear Down");
      end if;

      CAC.Trace.Tasks.Report;
      Log (Debug, Here, Who & " exit");
   end Tear_Down;

   ---------------------------------------------------------------
   procedure Test_Main (
      T                          : in out Test_Type) is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");
      T.Connection.Run;
      if Options.Pause then
         Pause ("before waiting for exit");
      end if;

      declare
         Mouse_Clicked           : Boolean := False;
         Timeout                 : constant Ada.Calendar.Time := Ada.Calendar.Clock + 2.0;

      begin
         loop
            if T.Created then             -- wait until window created
               if not Mouse_Clicked and not Options.Manual then   -- when not Manual simulate mouse click
                  Mouse_Clicked := True;
                  Log (Debug, Here, Who & " simulate mouse click");
                  Ok_Handler (T.Connection.Object.all);     -- simulate the click
               end if;

               if T.Connection.OK_Pressed then
                  Log (Debug, Here, Who & " exit succeed");
                  return;
               end if;
            elsif Ada.Calendar.Clock > Timeout then
               Log (Debug, Here, Who & " timeout waiting for mouse click");
               exit;
            end if;
            delay 0.1;
         end loop;
      end;

      Assert (False, "Created should be set");
      Assert (False, "Ok should have been pressed");

   exception
      when Fault: others =>
         CAC.Unit_Test.Setup.Set_Up_Exception (Fault, Here, Who);
   end Test_Main;

end Main_Tests;
