with AUnit.Test_Caller;
with Main_Tests;

package body Main_Suite is

   package Dictionary_Caller is new AUnit.Test_Caller (Main_Tests.Test_Type);

   function Suite return Access_Test_Suite is
      Tests : constant Access_Test_Suite := new Test_Suite;
   begin
      if Do_Main_Tests then
         Tests.Add_Test (Dictionary_Caller.Create ("Test Main Window",
            Main_Tests.Test_Main'Access));
      end if;

      return Tests;
   end Suite;

end Main_Suite;
