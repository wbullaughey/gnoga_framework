----
--  Copyright (C) 2008, AdaCore
--
with AUnit;
with AUnit.Test_Fixtures;
with Framework;
--with Tabbed_Window_Framework;
with Gnoga.Application.Multi_Connect;
with Gnoga.Gui.Base;
with Gnoga.Gui.Element.Form;
--with Gnoga.Gui.View;
with Gnoga.Gui.Window;
--with Gnoga.Types;

package Main_Tests is

   type Test_Type;
   type Connection_Data_Type          is new Framework.Connection_Data_Type with record
      Form                       : Gnoga.Gui.Element.Form.Form_Type;
      Object                     : Gnoga.Gui.Base.Pointer_To_Base_Class;
      Ok_Button                  : Gnoga.Gui.Element.Form.Input_Button_Type;
      Ok_Pressed                 : Boolean := False;
      Test                       : access Test_Type;
   end record;

   type Connection_Class_Access  is access all Connection_Data_Type'class;

   procedure Connection_Handler (             -- handle new connection from browser
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class;
      Connection                 : access Gnoga.Application.Multi_Connect.Connection_Holder_Type);

   type Test_Type                is new AUnit.Test_Fixtures.Test_Fixture with record
      Connection                 : aliased Connection_Data_Type;
      Created                    : Boolean := False;
   end record;

   procedure Set_Up (T : in out Test_Type);
   procedure Tear_Down (T : in out Test_Type);

   procedure Test_Main (
      T                          : in out Test_Type);

      Debug                      : Boolean := false;

end Main_Tests;
