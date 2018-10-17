----
--  Copyright (C) 2008, AdaCore
--
with AUnit;
with AUnit.Test_Fixtures;
--with Tabbed_Window_Framework;
with Gnoga.Application.Multi_Connect;
--with Gnoga.Gui.Element.Form;
--with Gnoga.Gui.View;
with Gnoga.Gui.Window;
--with Gnoga.Types;
with Top_Window;

package Top_Window_Tests is

   type Test_Type;
   type Connection_Type          is new Top_Window.Connection_Data_Type with record
      Test                       : access Test_Type;
   end record;

   type Connection_Class_Access  is access all Connection_Type'class;

   type View_Type                is new Top_Window.View_Type with null record;

   type View_Class_Access        is access all View_Type'class;

   procedure Connection_Handler (             -- handle new connection from browser
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class;
      Connection                 : access Gnoga.Application.Multi_Connect.Connection_Holder_Type);

   type Test_Type                is new AUnit.Test_Fixtures.Test_Fixture with record
      Connection                 : aliased Connection_Type;
      Created                    : Boolean := False;
      View                       : View_Class_Access;
   end record;

   procedure Set_Up (T : in out Test_Type);
   procedure Tear_Down (T : in out Test_Type);

   procedure Test_Popup_Window (
      T                          : in out Test_Type);

   procedure Test_Top_Window (
      T                          : in out Test_Type);

   Debug                         : Boolean := false;
   Interactive                   : Boolean := false;

end Top_Window_Tests;
