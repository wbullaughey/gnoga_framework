--
--  Copyright (C) 2008, AdaCore
--
with AUnit.Test_Suites; use AUnit.Test_Suites;

package Docker_Suite is

   Do_Docker_Tests                     : Boolean := True;

   function Suite return Access_Test_Suite;

end Docker_Suite;
