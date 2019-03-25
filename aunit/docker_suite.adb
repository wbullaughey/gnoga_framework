with AUnit.Test_Caller;
with Docker_Tests;
with Docker_Child_Tests;

package body Docker_Suite is

   package Docker_Test_Caller is new AUnit.Test_Caller (Docker_Tests.Docker_Test_Type);
   package Docker_Child_Test_Caller is new AUnit.Test_Caller (Docker_Child_Tests.Docker_Child_Test_Type);
-- package Table_Test_Caller is new AUnit.Test_Caller (Docker_Tests.Docker_Table_Test_Type);

   function Suite return Access_Test_Suite is
      Tests : constant Access_Test_Suite := new Test_Suite;
   begin
      if Do_Docker_Tests then
         Tests.Add_Test (Docker_Test_Caller.Create ("Test_Docker",
            Docker_Tests.Test_Docker'Access));

         Tests.Add_Test (Docker_Child_Test_Caller.Create ("Test_Docker_Child",
            Docker_Child_Tests.Test_Docker_Child'Access));

--       Tests.Add_Test (Table_Test_Caller.Create ("Test_Table",
--          Docker_Tests.Test_Table'Access));
      end if;

      return Tests;
   end Suite;

end Docker_Suite;
