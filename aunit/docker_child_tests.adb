with Ada.Calendar;
with Ada.Text_IO;use Ada.Text_IO;
with Aunit.Assertions; use Aunit.Assertions;
with CAC.Trace; use CAC.Trace;
with CAC.Unit_Test.Setup;
with Framework.Dock.Dock_Helper;
with Gnoga.Gui.Base;
with Gnoga.Gui.View.Docker;
with Gnoga.Gui.Element.Common;
with Options;

package body Docker_Child_Tests is

   use type Ada.Calendar.Time;

   package Dock_Helper_Package is new Dock_Child_Package.Dock_Helper;

   type Card_1_Type              is new Gnoga.Gui.View.View_Type with record
      Content                    : Gnoga.Gui.Element.Common.DIV_Type;
   end record;

   type Card_1_Access            is access Card_1_Type'class;

   overriding
   procedure Create (
      Card                       : in out Card_1_Type;
      Parent                     : in out Gnoga.Gui.Base.Base_Type'Class;
      ID                         : in     String);

   type Card_2_Type              is new Framework.Dock_Base.Docker_Type with record
      Content                    : Gnoga.Gui.Element.Common.DIV_Type;
   end record;

   type Card_2_Access            is access Card_2_Type;

   overriding
   procedure Create (
      Card                       : in out Card_2_Type;
      Parent                     : in out Gnoga.Gui.Base.Base_Type'Class;
      ID                         : in     String);

   type Child_Type               is new Gnoga.Gui.View.View_Type with record
      Content                    : Gnoga.Gui.Element.Common.DIV_Type;
   end record;

   type Child_Access             is access Child_Type'class;

   overriding
   procedure Create (
      Child                       : in out Child_Type;
      Parent                     : in out Gnoga.Gui.Base.Base_Type'Class;
      ID                         : in     String);

   type Card_3_Type              is new Framework.Dock_Base.Docker_Type with record
      Child_1                    : aliased Child_Type;
      Child_2                    : aliased Child_Type;
      Child_3                    : aliased Child_Type;
   end record;

   type Card_3_Access            is access Card_3_Type;

   overriding
   procedure Create (
      Card                       : in out Card_3_Type;
      Parent                     : in out Gnoga.Gui.Base.Base_Type'Class;
      ID                         : in     String);

   procedure Docker_Child_Test_Button_Handler (
      Object                     : in out Gnoga.Gui.Base.Base_Type'Class);

   procedure Resize_Handler (
      Object                     : in out Gnoga.Gui.Base.Base_Type'Class);

-- function Numbered_ID (
--    ID                         : in     String;
--    Counter                    : in     Positive
-- ) return String;

-- procedure On_Submit (Object : in out Gnoga.Gui.Base.Base_Type'Class);
   --  Handle interactive submit

   Card_1_Label                  : constant String := "Card 1";
-- Expected_Check_Box_ID         : Framework.Unbounded_String;
-- Expected_Edit_Field_ID        : Framework.Unbounded_String;

   ---------------------------------------------------------------
   overriding
   procedure Application_Initialization (             -- handle new connection from browser
      Connection_Data            : in out Dock_Child_Test_Connection_Data_Type;
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class) is
   pragma Unreferenced (Main_Window);
   ---------------------------------------------------------------

      Card_1                     : Card_1_Access;
      Card_2                     : Card_2_Access;
      Card_3                     : Card_3_Access;
      Class_Connection_Data      : Dock_Child_Test_Connection_Data_Type'class renames
                                    Dock_Child_Test_Connection_Data_Type'class (Connection_Data);
      ID                         : constant String := "card 1";

   begin
      Log (Debug, Here, Who & " enter");
      Log (Debug,  Here,  Who & " add card 1");
      Card_1 := new Card_1_Type;
      Card_1.Dynamic;
      Card_1.Create (Connection_Data.Cards, ID);
      Class_Connection_Data.Add_Card (Card_1_Label, Card_1,
            Select_Card => True);
--          Card_ID     => "card 1");

      Log (Debug,  Here,  Who & " add button");

      Class_Connection_Data.Add_Button ("test_button", Docker_Child_Test_Button_Handler'access);

      Log (Debug,  Here,  Who & " add card 2");
      Card_2 := new Card_2_Type;
      Card_2.Dynamic;
      Card_2.Create (Connection_Data.Parent.all, "card 2");
      Class_Connection_Data.Add_Card ("Test Card 2 ", Card_2,
            Select_Card => False);
--          Card_ID     => "card 2");

      Log (Debug,  Here,  Who & " add card 3");
      Card_3 := new Card_3_Type;
      Card_3.Dynamic;
      Card_3.Create (Connection_Data.Parent.all, "card 3");
      Class_Connection_Data.Add_Card ("Test Card 3 ", Card_3,
            Select_Card => False);
--          Card_ID     => "card 3");
      Card_3.Fill_Dock (Card_3.Child_1'access);
      Card_3.Left_Dock (Card_3.Child_2'access);
      Card_3.Right_Dock (Card_3.Child_3'access);

      Log (Debug, Here, Who & " exit");
   end Application_Initialization;

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
      if Options.Manual then                 -- tell tester what to do
         Card.Content.Put_Line ("Instructions:");
         Card.Content.Put_Line ("    click the test button");
         Card.Content.Put_Line ("    click the exit button");
      end if;
      Log (Debug, Here, Who & " exit 1");
   end Create;

   ---------------------------------------------------------------
   overriding
   procedure Create (
      Card                       : in out Card_2_Type;
      Parent                     : in out Gnoga.Gui.Base.Base_Type'Class;
      ID                         : in     String) is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter 2");
      Framework.Dock_Base.Docker_Type (Card).Create (Parent, ID);
      Card.Content.Create (Card, "card 2 content", "card 2 ID");
      Log (Debug, Here, Who & " exit 2");
   end Create;

   ---------------------------------------------------------------
   overriding
   procedure Create (
      Card                       : in out Card_3_Type;
      Parent                     : in out Gnoga.Gui.Base.Base_Type'Class;
      ID                         : in     String) is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter 3");
      Framework.Dock_Base.Docker_Type (Card).Create (Parent, ID);
      Card.Child_1.Create (Card, "child 1");
      Card.Child_2.Create (Card, "child 2");
      Card.Child_3.Create (Card, "child 3");
      Card.On_Resize_Handler (Resize_Handler'access);
      Log (Debug, Here, Who & " exit 3");
   end Create;

   ---------------------------------------------------------------
   overriding
   procedure Create (
      Child                       : in out Child_Type;
      Parent                     : in out Gnoga.Gui.Base.Base_Type'Class;
      ID                         : in     String) is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter child");
      Gnoga.Gui.View.View_Type (Child).Create (Parent, ID);
      Child.Content.Create (Parent, ID);
      Log (Debug, Here, Who & " exit 3");
   end Create;

   ---------------------------------------------------------------
   procedure Docker_Child_Test_Button_Handler (
      Object                     : in out Gnoga.Gui.Base.Base_Type'Class) is
   ---------------------------------------------------------------

      Connection_Data            : Docker_Child_Test_Connection_Data_Type renames
                                    Docker_Child_Test_Connection_Data_Type (Object.Connection_Data.all);
   begin
      Log (Debug, Here, Who & " enter");
      Connection_Data.Test_Pressed := True;
      Log (Debug, Here, Who & " exit");
   end Docker_Child_Test_Button_Handler;

   ---------------------------------------------------------------
   procedure Finish_Up (
      T                          : in out Docker_Child_Test_Type) is
   ---------------------------------------------------------------

      Mouse_Clicked           : Boolean := False;
      Timeout                 : constant Ada.Calendar.Time := Ada.Calendar.Clock + 2.0;

   begin
--    T.Connection_Data.Docker
      while Ada.Calendar.Clock < Timeout loop
         if Options.Manual then
            Put_Line ("click the test button and then exit button");
            T.Connection_Data.Wait_For_Exit;     -- will wait forever for exit click
            Assert (T.Connection_Data.Test_Pressed, "Test should have been pressed");
            Log (Debug, Here, Who & " exit succeed");
            return;
         end if;

         if T.Connection_Data.Did_Exit then
            Log (Debug, Here, Who & " exit succeed");
            return;
         end if;

         if not (Options.Pause or Mouse_Clicked) then
            Log (Debug, Here, Who & " simulate mouse click");
            Dock_Helper_Package.Press_Exit (T.Connection_Data);
            Mouse_Clicked := True;
         end if;

         delay 0.1;
      end loop;

      Assert (False, "Created should be set");
      Assert (False, "Ok should have been pressed");
      Log (Debug, Here, Who & " exit failure");
   end Finish_Up;

   ---------------------------------------------------------------
   overriding
   procedure Initialize (
      Connection_Data            : in out Dock_Child_Test_Connection_Data_Type) is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");
      -- allocate top level docker that will be child of main window
      Connection_Data.Docker := new Framework.Dock_Base.Docker_Type;
      Connection_Data.Docker.Dynamic;
   end Initialize;

-- ---------------------------------------------------------------
-- function Numbered_ID (
--    ID                         : in     String;
--    Counter                    : in     Positive
-- ) return String is
-- ---------------------------------------------------------------
--
-- begin
--    return ID & Strings.Trim (Counter'img);
-- end Numbered_ID;

--   ---------------------------------------------------------------
--   procedure On_Submit (Object : in out Gnoga.Gui.Base.Base_Type'Class) is
--   ---------------------------------------------------------------
--
----    App : constant App_Access := App_Access (Object.Connection_Data);
--
--   begin
--      Log (Debug, Here, Who & " enter");
--   end On_Submit;
--
   ---------------------------------------------------------------
   overriding
   function Parent (
      Connection_Data            : in out Dock_Child_Test_Connection_Data_Type
   ) return Gnoga.Gui.View.Card.Pointer_To_Card_View_Class is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");
      return Connection_Data.Cards'unchecked_access;
   end Parent;

   ---------------------------------------------------------------
   procedure Resize_Handler (
      Object                     : in out Gnoga.Gui.Base.Base_Type'Class) is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");
      Log (Debug, Here, Who & " exit");
   end Resize_Handler;

   ---------------------------------------------------------------
   procedure Set_Up (
      T                          : in out Docker_Child_Test_Type) is
   ---------------------------------------------------------------

      Connection_Data            : Docker_Child_Test_Connection_Data_Type renames T.Connection_Data;

   begin
      Log (Debug, Here, Who & " enter");
      Connection_Data.Test := T'unchecked_access;
Log (Here, Who);
      Connection_Data.Initialize_Dock ("docker test title", Options.Port);
Log (Here, Who);
--    Connection_Data.Run;

      Log (Debug, Here, Who & " exit");

   exception
      when Fault: others =>
         CAC.Unit_Test.Setup.Set_Up_Exception (Fault, Here, Who);
   end Set_Up;

   ---------------------------------------------------------------
   procedure Tear_Down (T : in out Docker_Child_Test_Type) is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");
      T.Connection_Data.Wait_For_Exit;
      T.Connection_Data.Stop;
      Log (Debug, Here, Who & " exit");
   end Tear_Down;

   ---------------------------------------------------------------
   procedure Test_Docker_Child (
      T                          : in out Docker_Child_Test_Type) is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");

      if Options.Pause then
         Pause ("before teardown");
      end if;

      T.Finish_Up ;

   exception
      when Fault: others =>
         Trace_Exception (Fault, Here, Who);

   end Test_Docker_Child;



end Docker_Child_Tests;
