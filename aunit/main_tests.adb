with Ada.Calendar;
--with Ada.Exceptions;
--with Ada.Text_IO;use Ada.Text_IO;
with Aunit.Assertions; use Aunit.Assertions;
with CAC.Trace.Tasks; use CAC.Trace;
with CAC.Unit_Test.Setup;
--with Framework;
with Gnoga.Types;

--with AUnit.Assertions; use AUnit.Assertions;

package body Main_Tests is

   use type Ada.Calendar.Time;
   use type Gnoga.Types.Pointer_to_Connection_Data_Class;

   Connection_ID                 : constant String := "root";

   ---------------------------------------------------------------
   procedure Connection_Handler (             -- handle new connection from browser
      Main_Window    : in out Gnoga.Gui.Window.Window_Type'Class;
      Connection     : access Gnoga.Application.Multi_Connect.Connection_Holder_Type) is
   pragma Unreferenced (Connection);
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");

      declare
         Connection_Data         : constant Connection_Class_Access :=
                                    Connection_Class_Access (Framework.Get_Connection (Connection_ID));

      begin
         Connection_Data.Test.View.Create (Main_Window);
         Connection_Data.Test.Created := True;
         Connection_Data.Connection_Handler (Main_Window);
      end;

      Log (Debug, Here, Who & " exit");
   end Connection_Handler;

   ---------------------------------------------------------------
   procedure Set_Up (T : in out Test_Type) is
   ---------------------------------------------------------------
   begin
      Log (Debug, Here, Who & " enter");
      T.Connection.Test := T'unchecked_access;
      Framework.Create (T.Connection'unchecked_access, Connection_ID, T.View'unchecked_access,
         Connection_Handler'access, "main test title");
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
      CAC.Trace.Tasks.Report;
      Log (Debug, Here, Who & " exit");
   end Tear_Down;

   ---------------------------------------------------------------
   procedure Test_Main (
      T                          : in out Test_Type) is
   ---------------------------------------------------------------

      Timeout                    : constant Ada.Calendar.Time := Ada.Calendar.Clock + 2.0;

   begin
      Log (Debug, Here, Who & " enter");
      T.Connection.Run;
      while Ada.Calendar.Clock < Timeout loop
         if T.Created then
            Log (Debug, Here, Who & " exit succeed");
            return;
         end if;
         delay 0.1;
      end loop;
      Assert (False, "Created should be set");
      Log (Debug, Here, Who & " exit failure");
   end Test_Main;

end Main_Tests;
