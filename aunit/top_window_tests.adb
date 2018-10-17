--with Ada.Exceptions;
--with Ada.Text_IO;use Ada.Text_IO;
with Ada.Unchecked_Deallocation;
with Aunit.Assertions; use Aunit.Assertions;
with CAC.Trace; use CAC.Trace;
--with CAC.Trace.Tasks; use CAC.Trace;
with CAC.Unit_Test.Setup;
with Framework;
with Gnoga.Types;

--with AUnit.Assertions; use AUnit.Assertions;

package body Top_Window_Tests is

   use type Gnoga.Types.Pointer_to_Connection_Data_Class;

   procedure Free is new Ada.Unchecked_Deallocation (
      Object         => View_Type'class,
      Name           => View_Class_Access);

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
      T.View := new View_Type;
      Framework.Create (T.Connection'unchecked_access, Connection_ID,
         Framework.View_Class_Access (T.View),
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
      Free (T.View);
      Log (Debug, Here, Who & " exit");
   end Tear_Down;

   ---------------------------------------------------------------
   procedure Test_Popup_Window (
      T                          : in out Test_Type) is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");
      T.Connection.Run;
--    delay 0.5;
      Assert (T.Created, "Created should be set");

      if Interactive then
         while not T.Connection.Exited loop
            delay 0.2;
         end loop;
      end if;
      Log (Debug, Here, Who & " exit");
   end Test_Popup_Window;

   ---------------------------------------------------------------
   procedure Test_Top_Window (
      T                          : in out Test_Type) is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");
      T.Connection.Run;
--    delay 0.5;
      Assert (T.Created, "Created should be set");
      Log (Debug, Here, Who & " exit");
   end Test_Top_Window;

end Top_Window_Tests;
