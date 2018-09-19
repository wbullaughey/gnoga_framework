with Ada.Exceptions;
with Ada.Text_IO;use Ada.Text_IO;
with CAC.Trace; use CAC.Trace;
with CAC.Unit_Test.Setup;

with AUnit.Assertions; use AUnit.Assertions;

package body Main_Tests is

   ---------------------------------------------------------------
   procedure Set_Up (T : in out Test_Type) is
   ---------------------------------------------------------------
   begin
      Log (Debug, Here, Who & " enter");
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
      Log (Debug, Here, Who & " exit");
   end Tear_Down;

   ---------------------------------------------------------------
   procedure Test_Main (
      T                          : in out Test_Type) is
      pragma Unreferenced (T);
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");
      Log (Debug, Here, Who & " exit");
   end Test_Main;

end Main_Tests;
