----
--  Copyright (C) 2008, AdaCore
--
with AUnit;
with AUnit.Test_Fixtures;

package Main_Tests is

   type Test_Type is new AUnit.Test_Fixtures.Test_Fixture with null record;

   procedure Set_Up (T : in out Test_Type);
   procedure Tear_Down (T : in out Test_Type);

   procedure Test_Main (
      T                       : in out Test_Type);

   Debug                      : Boolean := True;

end Main_Tests;
