----
--  Copyright (C) 2008, AdaCore
--
with AUnit;
with AUnit.Test_Fixtures;
with Framework.Dock;
--with Framework;
--with Tabbed_Window_Framework;
--with Gnoga.Application.Multi_Connect;
with Gnoga.Gui.Base;
with Gnoga.Gui.Element.Form;
with Gnoga.Gui.Element.Table;
with Gnoga.Gui.View.Docker;
with Gnoga.Gui.Window;
--with Gnoga.Types;

package Docker_Tests is

   Failed                        : exception;

   type Docker_Test_Type;
   type Dock_Test_Connection_Data_Type
                                 is new Framework.Dock.Connection_Data_Type with record
      Object                     : Gnoga.Gui.Base.Pointer_To_Base_Class;
      Test_Pressed               : Boolean := False;
      Test                       : access Docker_Test_Type;
   end record;

   overriding
   procedure Application_Initialization (
      Connection_Data            : in out Dock_Test_Connection_Data_Type;
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class);

   package Dock_Package is new Framework.Dock.Dock_Framework (
                                    Dock_Test_Connection_Data_Type);

   subtype Docker_Test_Connection_Data_Type
                                 is Dock_Package.Generic_Connection_Data_Type;

   type Docker_Test_Connection_Data_Class_Access  is access all
                                    Docker_Test_Connection_Data_Type'class;

   type Docker_Test_Type         is new AUnit.Test_Fixtures.Test_Fixture with record
      Connection_Data            : aliased Docker_Test_Connection_Data_Type;
   end record;

   procedure Finish_Up (
      T                          : in out Docker_Test_Type;
      Test_Pressed               : in     Boolean);

   procedure Set_Up (T : in out Docker_Test_Type);
   procedure Tear_Down (T : in out Docker_Test_Type);

   procedure Test_Docker (
      T                          : in out Docker_Test_Type);

   type Row_Type                 is new Gnoga.Gui.Element.Table.Table_Row_Type with record
      Button                     : Gnoga.Gui.Element.Form.Input_Button_Type;
      Button_Column              : Gnoga.Gui.Element.Table.Table_Column_Type;
      Check_Box                  : Gnoga.Gui.Element.Form.Check_Box_Type;
      Check_Box_Column           : Gnoga.Gui.Element.Table.Table_Column_Type;
      Edit_Field_Column          : Gnoga.Gui.Element.Table.Table_Column_Type;
      Edit_Field                 : Gnoga.Gui.Element.Form.Text_Type;
      Fixed_Column               : Gnoga.Gui.Element.Table.Table_Column_Type;
      Fixed_Field                : Gnoga.Gui.View.View_Type;
   end record;

   type Row_Access               is access Row_Type;

   type Table_Test_Type;
   type Table_Test_Connection_Data_Type
                                 is new Framework.Dock.Connection_Data_Type with record
      Card                       : Gnoga.Gui.Element.Pointer_To_Element_Class;
--    Dock                       : aliased Framework.Dock.Dock_Type;
      Form                       : Gnoga.Gui.Element.Form.Form_Type;
      Object                     : Gnoga.Gui.Base.Pointer_To_Base_Class;
      Row_Count                  : Natural := 0;
      Table                      : Gnoga.Gui.Element.Table.Table_Type;
      Table_Body                 : Gnoga.Gui.Element.Table.Table_Body_Type;
      Table_Header               : Gnoga.Gui.Element.Table.Table_Header_Type;
      Table_Header_Row           : Gnoga.Gui.Element.Table.Table_Row_Type;
      Table_Offset               : Natural := 0;
      Test                       : access Table_Test_Type;
      Test_Pressed               : Boolean := False;
   end record;

   type Table_Test_Connection_Data_Class_Access  is access all
      Table_Test_Connection_Data_Type'class;

   type Table_Test_Type          is new AUnit.Test_Fixtures.Test_Fixture with record
      Connection_Data            : aliased Table_Test_Connection_Data_Type;
   end record;

   overriding
   procedure Application_Initialization (
      Connection_Data            : in out Table_Test_Connection_Data_Type;
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class);

   procedure Finish_Up (
      T                          : in out Table_Test_Type;
      Test_Pressed               : in     Boolean);

   procedure Set_Up (T : in out Table_Test_Type);
   procedure Tear_Down (T : in out Table_Test_Type);

   procedure Test_Table (
      T                          : in out Table_Test_Type);

   Debug                         : Boolean := false;

end Docker_Tests;
