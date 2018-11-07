with AUnit.Test_Caller;
with Docker_Tests;

package body Docker_Suite is

   package Docker_Test_Caller is new AUnit.Test_Caller (Docker_Tests.Test_Type);

   function Suite return Access_Test_Suite is
      Tests : constant Access_Test_Suite := new Test_Suite;
   begin
      if Do_Docker_Tests then
         Tests.Add_Test (Docker_Test_Caller.Create ("Test Docker Window",
            Docker_Tests.Test_Docker'Access));
      end if;

      return Tests;
   end Suite;

end Docker_Suite;
