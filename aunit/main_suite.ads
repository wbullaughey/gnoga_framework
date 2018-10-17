--
--  Copyright (C) 2008, AdaCore
--
with AUnit.Test_Suites; use AUnit.Test_Suites;

package Main_Suite is

   Do_Main_Tests                 : Boolean := True;
   Do_Top_Window_Tests                 : Boolean := True;

   function Suite return Access_Test_Suite;

end Main_Suite;
