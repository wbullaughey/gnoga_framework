with Ada.Calendar;
with CAC.Trace; use CAC.Trace;
--with Gnoga.Application.Multi_Connect;
with Gnoga.Gui.Element.Common;
--with Gnoga.Gui.Base;
with Gnoga.Gui.View.Docker;

package body Framework.Dock is

-- use type Gnoga.Gui.Element.Pointer_To_Element_Class;
-- use type Gnoga.Gui.View.Docker.Pointer_To_Docker_View_Class;
   use type Gnoga.Gui.View.Pointer_To_View_Base_Class;
-- use type Framework.Dock_Base.Dock_Class_Access;

   ----------------------------------------------------------------------------
   procedure Add_Button (
      Connection_Data            : in out Dock_Connection_Data_Type;
      Label                      : in     String;
      On_Click_Handler           : in     Gnoga.Gui.Base.Action_Event) is
   ----------------------------------------------------------------------------

      Button                     : constant Gnoga.Gui.Element.Common.Pointer_To_Button_Class :=
                                    new Gnoga.Gui.Element.Common.Button_Type;
   begin
      Log (Debug, Here, Who & " enter");
      Button.Create (Connection_Data.Panel, Label);
      Button.On_Click_Handler (On_Click_Handler);
      Button.Dynamic;
      Log (Debug, Here, Who & " exit");
   end Add_Button;

   ----------------------------------------------------------------------------
   overriding
   procedure Add_Card (
      Connection_Data            : in out Dock_Connection_Data_Type;
      Tab_Title                  : in     String;
      Card                       : access Gnoga.Gui.View.View_Base_Type'class;
      Select_Card                : in     Boolean) is
--    Card_ID                    : in     String := "") is
   ----------------------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter title '" & Tab_Title & "' select " & Select_Card'img);
--       " ID '" & Card_ID & "'");
      Card.Box_Height (100, "%");

      Connection_Data.Cards.Add_Card (
         Name => Tab_Title,
         Card => Card);
      Connection_Data.Tabs.Add_Tab (Tab_Title, Tab_Title, Selected => Select_Card);
      Log (Debug, Here, Who & " exit");
   end Add_Card;

   ----------------------------------------------------------------------------
   overriding
   procedure Connection_Handler (             -- handle new connection from browser
      Connection_Data            : in out Dock_Connection_Data_Type;
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class) is
   ----------------------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");
      Connection_Data.Set_Window (Main_Window'unchecked_access);  -- need to set Main_Window before start creating objects
                                                                  -- so message loops can run
      Connection_Data.Docker.Create (Main_Window, "top level dock");
--    Connection_Data.Docker.Create (Connection_Data.Dock.all, "Docker");
--    Connection_Data.Docker.Box_Height (100, "%");
--    Connection_Data.Dock.Top_Dock (Connection_Data.Docker'Access);

      Connection_Data.Panel.Create (Connection_Data.Docker.all, "Panel");
      Connection_Data.Panel.Background_Color ("silver");
      Connection_Data.Docker.Top_Dock (Connection_Data.Panel'Access);

      Connection_Data.Exit_Button.Create (Connection_Data.Panel, "Exit Application");
      Connection_Data.Exit_Button.On_Click_Handler (On_Exit'Unrestricted_Access);

      Connection_Data.Deck.Create (Connection_Data.Docker.all, "Deck");
--    Connection_Data.Deck.Box_Height (100, "%");
      Connection_Data.Docker.Fill_Dock (Connection_Data.Deck'Access);

      Connection_Data.Cards.Create (Connection_Data.Deck, "Cards");
      Connection_Data.Cards.Box_Height (100, "%");
      Connection_Data.Cards.Border;
      Connection_Data.Deck.Fill_Dock (Connection_Data.Cards'Access);

--    Connection_Data.Deck.Border;

      Connection_Data.Tabs.Create (
         Parent      => Connection_Data.Deck,
         Card_View   => Connection_Data.Cards,
         ID          => "Tabs");

      -- call application to add buttons and tab/card pairs
      Connection_Data_Type'class (Connection_Data).Application_Initialization (Main_Window);

      Connection_Data.Deck.Top_Dock (Connection_Data.Tabs'Access);
      --  We wait to dock Tabs until after we have added the tabs
      --  this ensures that Tabs's Height with content is known.
      Connection_Data.Dock_Initialized := True;
      Log (Debug, Here, Who & " exit");
   end Connection_Handler;

   ----------------------------------------------------------------------------
   function Did_Exit (
      Connection_Data            : in out Dock_Connection_Data_Type
   ) return Boolean is
   ----------------------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");
      return Connection_Data.Exit_Occured.Test;
   end Did_Exit;

   ----------------------------------------------------------------------------
   overriding
   function Find_Card (
      Connection_Data            : in     Dock_Connection_Data_Type;
      ID                         : in     String
   ) return Gnoga.Gui.View.Pointer_To_View_Base_Class is
   ----------------------------------------------------------------------------

      Card_Pointer               : constant Gnoga.Gui.View.Pointer_To_View_Base_Class :=
                                          Connection_Data.Cards.Card (ID);

--    Result                     : constant Gnoga.Gui.View.Docker.Pointer_To_Docker_View_Class :=
--                                  Gnoga.Gui.View.Docker.Pointer_To_Docker_View_Class (
   begin
      Log (Debug, Here, Who & " enter. ID '" & ID & "'");
      if Card_Pointer = Null then
         raise Failed with "Could not find card '" & ID & "' at " & Here;
      end if;

      Log (Debug, Here, Who & " exit");
      return Card_Pointer;
   end Find_Card;

   ----------------------------------------------------------------------------
   procedure Initialize_Dock (
      Connection_Data            : in out Dock_Connection_Data_Type;
      Title                      : in     String;
      HTTP_Port                  : in     Positive := 8080) is
   ----------------------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");
      Framework.Connection_Data_Type (Connection_Data).Initialize (
         Title, HTTP_Port);
      Connection_Data.Run;
      Log (Debug, Here, Who & " exit");
   end Initialize_Dock;

   ----------------------------------------------------------------------------
   procedure On_Exit (
      Object                     : in out Gnoga.Gui.Base.Base_Type'Class) is
   ----------------------------------------------------------------------------

      Connection_Data            : Dock_Connection_Data_Type renames
                                    Dock_Connection_Data_Type (Object.Connection_Data.all);
   begin
      Log (Debug, Here, Who & " enter");
      Connection_Data.Exit_Occured.Set;
      Log (Debug, Here, Who & " exit");
   end On_Exit;

   ----------------------------------------------------------------------------
   function Parent (
      Connection_Data            : in out Dock_Connection_Data_Type
   ) return Gnoga.Gui.View.Card.Pointer_To_Card_View_Class is
   ----------------------------------------------------------------------------

   begin
      return Connection_Data.Cards'Unchecked_Access;
   end Parent;

   ----------------------------------------------------------------------------
   overriding
   procedure Run (
      Connection                 : in out Dock_Connection_Data_Type) is
   ----------------------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");
      Framework.Connection_Data_Type (Connection).Run;
      Connection.Wait_For_Initialization;
      Log (Debug, Here, Who & " exit");
   end Run;

   ----------------------------------------------------------------------------
   procedure Wait_For_Exit (
      Connection_Data            : in out Dock_Connection_Data_Type) is
   ----------------------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");
      Connection_Data.Exit_Occured.Wait;
      Log (Debug, Here, Who & " exit");
   end Wait_For_Exit;

   ----------------------------------------------------------------------------
   procedure Wait_For_Initialization (
      Connection_Data            : in     Dock_Connection_Data_Type) is
   ----------------------------------------------------------------------------

      use Ada.Calendar;

      Timeout                    : constant Time := Clock + 2.0;

   begin
      Log (Debug, Here, Who & " enter");
      while not Connection_Data.Dock_Initialized loop
         delay 0.15;
         if Clock > Timeout then
            raise Failed with "timeout waiting for Dock to initialize from " &
               Here;
         end if;
         Log (Debug, Here, Who & " waiting for dock initialization");
      end loop;

      Log (Debug, Here, Who & " exit");
   end Wait_For_Initialization;


end Framework.Dock;
