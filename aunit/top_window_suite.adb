with AUnit.Test_Caller;
with Top_Window_Tests;

package body Top_Window_Suite is

   package Top_Window_Caller is new AUnit.Test_Caller (Top_Window_Tests.Test_Type);

   function Suite return Access_Test_Suite is
      Tests : constant Access_Test_Suite := new Test_Suite;
   begin
      if Do_Top_Window_Tests then
         Tests.Add_Test (Top_Window_Caller.Create ("Test_Top_Window",
            Top_Window_Tests.Test_Top_Window'Access));

         Tests.Add_Test (Top_Window_Caller.Create ("Test_Popup_Window",
            Top_Window_Tests.Test_Popup_Window'Access));

      end if;

      return Tests;
   end Suite;

end Top_Window_Suite;
