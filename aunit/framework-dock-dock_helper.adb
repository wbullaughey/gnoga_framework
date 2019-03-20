--with CAC.Trace; use CAC.Trace;
--with Docker_Tests;
--with Gnoga.Gui.Base;

package body Framework.Dock.Dock_Helper is

-- procedure On_Create_Docker_Test (
--    Object                     : in out Gnoga.Gui.Base.Base_Type'Class);
--
-- procedure On_Create_Table_Test (
--    Object                     : in out Gnoga.Gui.Base.Base_Type'Class);

-- ---------------------------------------------------------------
-- procedure Initialize_Docker_Test (
--    Connection_Data            : in out Dock_Connection_Data_Type'class) is
-- ---------------------------------------------------------------
--
-- begin
--    Connection_Data.Exit_Button.On_Create_Handler (On_Create_Docker_Test'access);
-- end Initialize_Docker_Test;
--
-- ---------------------------------------------------------------
-- procedure Initialize_Table_Test (
--    Connection_Data            : in out Dock_Connection_Data_Type'class) is
-- ---------------------------------------------------------------
--
-- begin
--    Connection_Data.Exit_Button.On_Create_Handler (On_Create_Table_Test'access);
-- end Initialize_Table_Test;
--
-- ---------------------------------------------------------------
-- procedure On_Create_Docker_Test (
--    Object                     : in out Gnoga.Gui.Base.Base_Type'Class) is
-- ---------------------------------------------------------------
--
--    Connection_Data            : constant Docker_Tests.Docker_Test_Connection_Data_Class_Access :=
--                                  Docker_Tests.Docker_Test_Connection_Data_Class_Access (
--                                     Framework.Get_Connection);
-- begin
--    Log (Debug, Here, Who & " enter");
--    Connection_Data.Object := Object'unchecked_access;
-- end On_Create_Docker_Test;
--
-- ---------------------------------------------------------------
-- procedure On_Create_Table_Test (
--    Object                     : in out Gnoga.Gui.Base.Base_Type'Class) is
-- ---------------------------------------------------------------
--
--    Connection_Data            : constant Docker_Tests.Table_Tester_Connection_Data_Class_Access :=
--                                  Docker_Tests.Table_Tester_Connection_Data_Class_Access (
--                                     Framework.Get_Connection);
-- begin
--    Log (Debug, Here, Who & " enter");
--    Connection_Data.Object := Object'unchecked_access;
-- end On_Create_Table_Test;

   ---------------------------------------------------------------
   procedure Press_Exit (
      Connection_Data            : in out Dock_Connection_Data_Type'class) is
   ---------------------------------------------------------------

   begin
      On_Exit (Connection_Data.Exit_Button);
   end Press_Exit;
end Framework.Dock.Dock_Helper;
