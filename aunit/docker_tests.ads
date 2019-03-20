----
--  Copyright (C) 2008, AdaCore
--
--with Ada.Strings.Unbounded;
with AUnit;
with AUnit.Test_Fixtures;
with Framework.Dock;
with Framework.Dock_Base;
--with Framework.Nested_Docker;
--with Tabbed_Window_Framework;
--with Gnoga.Application.Multi_Connect;
--with Gnoga.Gui.Base;
--with Gnoga.Gui.Element.Form;
--with Gnoga.Gui.Element.Table;
with Gnoga.Gui.View;
with Gnoga.Gui.View.Card;
--with Gnoga.Gui.View.Docker;
with Gnoga.Gui.Window;
--with Gnoga.Types;
--with Widget.Table;

package Docker_Tests is

   Failed                        : exception;

   type Docker_Test_Type;
   type Dock_Test_Connection_Data_Type
                                 is new Framework.Dock_Base.Base_Connection_Data_Type with record
      Test_Pressed               : Boolean := False;
      Test                       : access Docker_Test_Type;
   end record;

   overriding
   procedure Application_Initialization (
      Connection_Data            : in out Dock_Test_Connection_Data_Type;
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class);

   overriding
   procedure Initialize (
      Connection_Data            : in out Dock_Test_Connection_Data_Type);

   overriding
   function Parent (
      Connection_Data            : in out Dock_Test_Connection_Data_Type
   ) return Gnoga.Gui.View.Card.Pointer_To_Card_View_Class;

-- overriding
-- procedure Application_Initialization (
--    Connection_Data            : in out Dock_Child_Test_Connection_Data_Type;
--    Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class);

   package Dock_Package is new Framework.Dock (
                                    Dock_Test_Connection_Data_Type);

   subtype Docker_Test_Connection_Data_Type
                                 is Dock_Package.Dock_Connection_Data_Type;

   type Docker_Test_Connection_Data_Class_Access  is access all
                                    Docker_Test_Connection_Data_Type'class;

   type Docker_Test_Type         is new AUnit.Test_Fixtures.Test_Fixture with record
      Connection_Data            : aliased Docker_Test_Connection_Data_Type;
   end record;

   procedure Finish_Up (
      T                          : in out Docker_Test_Type);

   procedure Set_Up (T : in out Docker_Test_Type);
   procedure Tear_Down (T : in out Docker_Test_Type);

   procedure Test_Docker (
      T                          : in out Docker_Test_Type);

-- type Dock_Child_Test_Connection_Data_Type
--                               is new Dock_Test_Connection_Data_Type with null record;
--
-- package Dock_Child_Package is new Framework.Dock (
--                                  Dock_Child_Test_Connection_Data_Type);
--
-- subtype Docker_Child_Test_Connection_Data_Type
--                               is Dock_Child_Package.Dock_Connection_Data_Type;
--
-- type Docker_Child_Test_Connection_Data_Class_Access  is access all
--                                  Docker_Child_Test_Connection_Data_Type'class;
--
-- type Docker_Child_Test_Type   is new AUnit.Test_Fixtures.Test_Fixture with record
--    Connection_Data            : aliased Docker_Child_Test_Connection_Data_Type;
-- end record;

-- procedure Finish_Up (
--    T                          : in out Docker_Child_Test_Type);

-- procedure Set_Up (T : in out Docker_Child_Test_Type);
-- procedure Tear_Down (T : in out Docker_Child_Test_Type);

   procedure Test_Docker_Child (
      T                          : in out Docker_Test_Type);

   Debug                         : Boolean := false;

end Docker_Tests;
