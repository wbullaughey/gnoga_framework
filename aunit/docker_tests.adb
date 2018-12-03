with Ada.Calendar;
with Ada.Text_IO;use Ada.Text_IO;
with Aunit.Assertions; use Aunit.Assertions;
with CAC.Trace; use CAC.Trace;
with CAC.Unit_Test.Setup;
with Framework.Dock.Helper;
--with Gnoga.Gui.Base;
with Gnoga.Gui.Element.Common;
with Gnoga.Gui.View;
--with Gnoga.Gui.Window;
with Options;

package body Docker_Tests is

   use type Ada.Calendar.Time;

   type Card_1_Type              is new Gnoga.Gui.View.View_Type with record
      Content                    : Gnoga.Gui.Element.Common.DIV_Type;
   end record;

   type Card_1_Access            is access Card_1_Type'class;

   overriding
   procedure Create (
      Card                       : in out Card_1_Type;
      Parent                     : in out Gnoga.Gui.Base.Base_Type'Class;
      ID                         : in     String);

   type Card_2_Type              is new Gnoga.Gui.View.View_Type with record
      Content                    : Gnoga.Gui.Element.Common.DIV_Type;
   end record;

   type Card_2_Access            is access Card_2_Type;

   procedure Button_Handler (
      Object                     : in out Gnoga.Gui.Base.Base_Type'Class);

   overriding
   procedure Create (
      Card                       : in out Card_2_Type;
      Parent                     : in out Gnoga.Gui.Base.Base_Type'Class;
      ID                         : in     String);

   Card_1_Label                  : constant String := "Card 1";

   ---------------------------------------------------------------
   procedure Add_Row (
      T                          : in out Table_Test_Type) is
   ---------------------------------------------------------------

      Connection_Data            : Table_Test_Connection_Data_Type renames T.Connection_Data;
      Row                        : constant Row_Access := new Row_Type;

   begin
      Log (Debug, Here, Who & " enter");
      Connection_Data.Row_Count := Connection_Data.Row_Count + 1;
      Row.Dynamic;

      Row.Create (Connection_Data.Table_Body);

      declare
         Value                   : constant String := "Fixed Field" & Connection_Data.Row_Count'img;

      begin
         Row.Fixed_Column.Create (Row.all);
         Row.Fixed_Field.Create (
            ID          => Value,
            Parent      => Row.Fixed_Column);
         Row.Fixed_Field.Text (Value);
      end;

      Row.Edit_Field_Column.Create (Row.all);
      Row.Edit_Field.Create (Connection_Data.Form,
         ID          => "Edit_Field",
         Name        => "Edit_Field",
         Size        => 10,
         Value       => "Edit_Field");
      Row.Edit_Field.Parent (Row.Edit_Field_Column);

      Row.Check_Box_Column.Create (Row.all);
      Row.Check_Box.Create (Connection_Data.Form,
         Checked     => False,
         ID          => "Check_Box",
         Name        => "Check_Box",
         Value       => "Check_Box");
      Row.Check_Box.Parent (Row.Check_Box_Column);

      Row.Button_Column.Create (Row.all);
      Row.Button.Create (Connection_Data.Form,
         ID          => "Button",
         Name        => "Button",
         Value       => "Button");
      Row.Button.Parent (Row.Button_Column);

      Log (Debug, Here, Who & " exit");
   end Add_Row;

   ---------------------------------------------------------------
   overriding
   procedure Application_Initialization (             -- handle new connection from browser
      Connection_Data            : in out Docker_Test_Connection_Data_Type;
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class) is
   pragma Unreferenced (Main_Window);
   ---------------------------------------------------------------

      Card_1                     : Card_1_Access;

   begin
      Log (Debug, Here, Who & " enter");

      Log (Debug,  Here,  Who & " add card 1");
      Card_1 := new Card_1_Type;
      Card_1.Dynamic;
      Connection_Data.Add_Card (Card_1_Label, Card_1,
         Select_Card => True,
         Card_ID     => "card 1");

      Log (Debug, Here, Who & " exit");
   end Application_Initialization;

   ---------------------------------------------------------------
   overriding
   procedure Application_Initialization (             -- handle new connection from browser
      Connection_Data            : in out Table_Test_Connection_Data_Type;
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class) is
   pragma Unreferenced (Main_Window);
   ---------------------------------------------------------------

      Card_1                     : Card_1_Access;

   begin
      Log (Debug, Here, Who & " enter");

      Log (Debug,  Here,  Who & " add card 1");
      Card_1 := new Card_1_Type;
      Card_1.Dynamic;
      Connection_Data.Add_Card (Card_1_Label, Card_1,
         Select_Card => True,
         Card_ID     => "card 1");

      Log (Debug, Here, Who & " exit");
   end Application_Initialization;

   ---------------------------------------------------------------
   procedure Button_Handler (
      Object                     : in out Gnoga.Gui.Base.Base_Type'Class) is
   ---------------------------------------------------------------

      Connection_Data            : constant Docker_Test_Connection_Data_Class_Access :=
                                    Docker_Test_Connection_Data_Class_Access (Object.Connection_Data);
   begin
      Log (Debug, Here, Who & " enter");
      if Connection_Data = Null then
         raise Failed with "bad connection data";
      end if;

      Connection_Data.Test_Pressed := True;
      Log (Debug, Here, Who & " exit");
   end Button_Handler;

   ---------------------------------------------------------------
   -- only works for card_1 of table_test
   procedure Card_1_Resize_Handler (
      Object                     : in out Gnoga.Gui.Base.Base_Type'Class) is
   ---------------------------------------------------------------

      Connection_Data            : Table_Test_Connection_Data_Type renames
                                    Table_Test_Connection_Data_Type (Object.Connection_Data.all);

   begin
      Log (Debug, Here, Who & " height" & Connection_Data.Card.Height'img);
      Connection_Data.Table_Body.Height (Connection_Data.Card.Height -
         Connection_Data.Table_Offset);
   end Card_1_Resize_Handler;

   ---------------------------------------------------------------
   overriding
   procedure Create (
      Card                       : in out Card_1_Type;
      Parent                     : in out Gnoga.Gui.Base.Base_Type'Class;
      ID                         : in     String) is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter 1 id " & ID & "'");
      Gnoga.Gui.View.View_Type (Card).Create (Parent, ID);
      Card.Content.Create (Card, "card 1 content", "card 1 content ID");
      Log (Debug, Here, Who & " exit 1");
   end Create;

   overriding
   ---------------------------------------------------------------
   procedure Create (
      Card                       : in out Card_2_Type;
      Parent                     : in out Gnoga.Gui.Base.Base_Type'Class;
      ID                         : in     String) is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter 2");
      Gnoga.Gui.View.View_Type (Card).Create (Parent, ID);
      Card.Content.Create (Card, "card 2 content", "card 2 ID");
      Log (Debug, Here, Who & " exit 2");
   end Create;

   ---------------------------------------------------------------
   procedure Finish_Up (
      T                          : in out Docker_Test_Type;
      Test_Pressed               : in     Boolean) is
   ---------------------------------------------------------------

      Mouse_Clicked           : Boolean := False;
      Timeout                 : constant Ada.Calendar.Time := Ada.Calendar.Clock + 2.0;

   begin
      while Ada.Calendar.Clock < Timeout loop
         if Options.Manual then
            Put_Line ("click the exit button");
            T.Connection_Data.Wait_For_Exit;     -- will wait forever for exit click
            Assert (T.Connection_Data.Test_Pressed or not Test_Pressed,
               "Test should have been pressed");
            Log (Debug, Here, Who & " exit succeed");
            return;
         end if;

         if T.Connection_Data.Did_Exit then
            Log (Debug, Here, Who & " exit succeed");
            return;
         end if;

         if not (Options.Pause or Mouse_Clicked) then
            Log (Debug, Here, Who & " simulate mouse click");
            Framework.Dock.Helper.Press_Exit (T.Connection_Data.Object);
            Mouse_Clicked := True;
         end if;

         delay 0.1;
      end loop;

      Assert (False, "Created should be set");
      Assert (False, "Ok should have been pressed");
      Log (Debug, Here, Who & " exit failure");
   end Finish_Up;

   ---------------------------------------------------------------
   procedure Finish_Up (
      T                          : in out Table_Test_Type;
      Test_Pressed               : in     Boolean) is
   ---------------------------------------------------------------

      Mouse_Clicked           : Boolean := False;
      Timeout                 : constant Ada.Calendar.Time := Ada.Calendar.Clock + 2.0;

   begin
      while Ada.Calendar.Clock < Timeout loop
         if Options.Manual then
            Put_Line ("click the exit button");
            T.Connection_Data.Wait_For_Exit;     -- will wait forever for exit click
            Assert (T.Connection_Data.Test_Pressed or not Test_Pressed,
               "Test should have been pressed");
            Log (Debug, Here, Who & " exit succeed");
            return;
         end if;

         if T.Connection_Data.Did_Exit then
            Log (Debug, Here, Who & " exit succeed");
            return;
         end if;

         if not (Options.Pause or Mouse_Clicked) then
            Log (Debug, Here, Who & " simulate mouse click");
            Framework.Dock.Helper.Press_Exit (T.Connection_Data.Dock'unchecked_access);
            Mouse_Clicked := True;
         end if;

         delay 0.1;
      end loop;

      Assert (False, "Created should be set");
      Assert (False, "Ok should have been pressed");
      Log (Debug, Here, Who & " exit failure");
   end Finish_Up;

   ---------------------------------------------------------------
   procedure Set_Up (
      T                          : in out Docker_Test_Type) is
   ---------------------------------------------------------------
   begin
      Log (Debug, Here, Who & " enter");
      T.Connection_Data.Test := T'unchecked_access;
      Framework.Dock.Helper.Initialize_Docker_Test (T.Connection_Data);
      T.Connection_Data.Initialize_Dock ( --Application_Initialization'access,
         "docker test title", Options.Port);
      T.Connection_Data.Run;

      Log (Debug, Here, Who & " exit");

   exception
      when Fault: others =>
         CAC.Unit_Test.Setup.Set_Up_Exception (Fault, Here, Who);
   end Set_Up;

   ---------------------------------------------------------------
   procedure Set_Up (
      T                          : in out Table_Test_Type) is
   ---------------------------------------------------------------
   begin
      Log (Debug, Here, Who & " enter");
      T.Connection_Data.Test := T'unchecked_access;
      Framework.Dock.Helper.Initialize_Table_Test (T.Connection_Data);
      T.Connection_Data.Initialize_Dock ( --Application_Initialization'access,
         "Table test title", Options.Port);
      T.Connection_Data.Run;

      Log (Debug, Here, Who & " exit");

   exception
      when Fault: others =>
         CAC.Unit_Test.Setup.Set_Up_Exception (Fault, Here, Who);
   end Set_Up;

   ---------------------------------------------------------------
   procedure Tear_Down (T : in out Docker_Test_Type) is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");
      T.Connection_Data.Wait_For_Exit;
      T.Connection_Data.Stop;
      Log (Debug, Here, Who & " exit");
   end Tear_Down;

   ---------------------------------------------------------------
   procedure Tear_Down (T : in out Table_Test_Type) is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");
      T.Connection_Data.Wait_For_Exit;
      T.Connection_Data.Stop;
      Log (Debug, Here, Who & " exit");
   end Tear_Down;

   ---------------------------------------------------------------
   procedure Test_Docker (
      T                          : in out Docker_Test_Type) is
   ---------------------------------------------------------------

      Card_2                     : Card_2_Access;

   begin
      Log (Debug, Here, Who & " enter");

      if Options.Pause then
         Pause ("before teardown");
      end if;

      Log (Debug,  Here,  Who & " add button");

      T.Connection_Data.Add_Button ("test_button", Button_Handler'access);

      Log (Debug,  Here,  Who & " add card 2");
      Card_2 := new Card_2_Type;
      Card_2.Dynamic;
      T.Connection_Data.Add_Card ("Test Card 2 ", Card_2,
         Select_Card => False,
         Card_ID     => "card 2");

      T.Finish_Up (Test_Pressed => False);

   exception
      when Fault: others =>
         Trace_Exception (Fault, Here, Who);

   end Test_Docker;

   ---------------------------------------------------------------
   procedure Test_Table (
      T                          : in out Table_Test_Type) is
   ---------------------------------------------------------------

      Connection_Data            : Table_Test_Connection_Data_Type renames T.Connection_Data;

   begin
      Log (Debug, Here, Who & " enter");

      if Options.Pause then
         Pause ("before teardown");
      end if;

      Connection_Data.Card := Connection_Data.Find_Card (Card_1_Label);
      Connection_Data.Dock.Create (Connection_Data.Card.all, "table dock");
      Connection_Data.Dock.Style ("display", "block");
      Connection_Data.Card.On_Resize_Handler (Card_1_Resize_Handler'access);

      Connection_Data.Form.Create (
         Parent      => Connection_Data.Dock,
         Action      => "submit_table",
         ID          => "table_form");
      Connection_Data.Table.Create (Connection_Data.Form, "table_id");
      Connection_Data.Table.Style ("display", "block");
--    Connection_Data.Table.Add_Caption ("docked table");
      Connection_Data.Table_Header.Create (Connection_Data.Table, "table header");
      Connection_Data.Table_Header_Row.Create (Connection_Data.Table_Header, "table header row");

      declare
         Heading                 : Gnoga.Gui.Element.Table.Table_Heading_Access :=
                                    new Gnoga.Gui.Element.Table.Table_Heading_Type;

      begin
         Heading.Dynamic;
         Heading.Create (Connection_Data.Table_Header_Row, "fixed");
         Heading := new Gnoga.Gui.Element.Table.Table_Heading_Type;
         Heading.Dynamic;
         Heading.Create (Connection_Data.Table_Header_Row, "edit");
         Heading := new Gnoga.Gui.Element.Table.Table_Heading_Type;
         Heading.Dynamic;
         Heading.Create (Connection_Data.Table_Header_Row, "check box");
         Heading := new Gnoga.Gui.Element.Table.Table_Heading_Type;
         Heading.Dynamic;
         Heading.Create (Connection_Data.Table_Header_Row, "button");
      end;

      Connection_Data.Table_Body.Create (Connection_Data.Table, "table Body");
      Connection_Data.Table_Body.Style ("display", "block");
      Connection_Data.Table_Body.Style ("overflow-y", "auto");

      Connection_Data.Table_Offset := Connection_Data.Table_Header.Height +
         Connection_Data.Object.Height;

      Log (Debug, Here, Who & " table offset" & Connection_Data.Table_Offset'img);

      for Counter in 1 .. 5 loop
         T.Add_Row;
      end loop;

      T.Finish_Up (Test_Pressed => False);
      Log (Debug, Here, Who & " exit");

   exception
      when Fault: others =>
         Trace_Exception (Fault, Here, Who);

   end Test_Table;

end Docker_Tests;
