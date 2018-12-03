with Ada.Calendar;
with CAC.Trace; use CAC.Trace;
--with Gnoga.Application.Multi_Connect;
--with Gnoga.Gui.Base;

package body Framework.Dock is

   procedure On_Exit (
      Object                     : in out Gnoga.Gui.Base.Base_Type'Class);

   ----------------------------------------------------------------------------
   procedure Application_Initialization (
      Connection_Data            : in out Connection_Data_Type;
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class) is
   ----------------------------------------------------------------------------

   begin
      raise Failed with "Application_Initialization must be overrident";
   end Application_Initialization;

   ----------------------------------------------------------------------------
   overriding
   procedure Connection_Handler (             -- handle new connection from browser
      Connection_Data            : in out Connection_Data_Type;
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class) is
   ----------------------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");
      Framework.Connection_Data_Type (Connection_Data).Connection_Handler(Main_Window);

      Connection_Data.Docker.Create (Main_Window, "Docker");

      Connection_Data.Panel.Create (Connection_Data.Docker, "Panel");
      Connection_Data.Panel.Background_Color ("silver");

      Connection_Data.Exit_Button.Create (Connection_Data.Panel, "Exit Application");
      Connection_Data.Exit_Button.On_Click_Handler (On_Exit'Unrestricted_Access);

      Connection_Data.Docker.Top_Dock (Connection_Data.Panel'Access);
      Connection_Data.Deck.Create (Connection_Data.Docker, "Deck");
      Connection_Data.Docker.Fill_Dock (Connection_Data.Deck'Access);

      Connection_Data.Cards.Create (Connection_Data.Deck, "Cards");
      Connection_Data.Cards.Border;
      Connection_Data.Deck.Fill_Dock (Connection_Data.Cards'Access);

      Connection_Data.Deck.Border;

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
   procedure On_Exit (
      Object                     : in out Gnoga.Gui.Base.Base_Type'Class) is
   ----------------------------------------------------------------------------

      Connection_Data            : Connection_Data_Type renames
                                    Connection_Data_Type (Object.Connection_Data.all);
   begin
      Log (Debug, Here, Who & " enter");
      Connection_Data.Exit_Occured.Set;
      Log (Debug, Here, Who & " exit");
   end On_Exit;

   ----------------------------------------------------------------------------
   overriding
   procedure Run (
      Connection                 : in out Connection_Data_Type) is
   ----------------------------------------------------------------------------

   begin
      Framework.Connection_Data_Type (Connection).Run;
      Connection.Wait_For_Initialization;
   end Run;

   ----------------------------------------------------------------------------
   procedure Wait_For_Initialization (
      Connection_Data            : in     Connection_Data_Type) is
   ----------------------------------------------------------------------------

      use Ada.Calendar;

      Timeout                    : constant Time := Clock + 2.0;

   begin
      while not Connection_Data.Dock_Initialized loop
         delay 0.15;
         if Clock > Timeout then
            raise Failed with "timeout waiting for Dock to initialize from " &
               Here;
         end if;
         Log (Debug, Here, Who & " waiting for dock initialization");
      end loop;

   end Wait_For_Initialization;

   package body Dock_Framework is

      ----------------------------------------------------------------------------
      procedure Add_Button (
         Connection_Data            : in out Generic_Connection_Data_Type;
         Label                      : in     String;
         On_Click_Handler           : in     Gnoga.Gui.Base.Action_Event) is
      ----------------------------------------------------------------------------

         Button                     : constant Gnoga.Gui.Element.Common.Pointer_To_Button_Class :=
                                       new Gnoga.Gui.Element.Common.Button_Type;
      begin
         Button.Create (Connection_Data.Panel, Label);
         Button.On_Click_Handler (On_Click_Handler);
         Button.Dynamic;
      end Add_Button;

      ----------------------------------------------------------------------------
      procedure Add_Card (
         Connection_Data            : in out Generic_Connection_Data_Type;
         Tab_Title                  : in     String;
         Card                       : access Gnoga.Gui.View.View_Type'class;
         Select_Card                : in     Boolean;
         Card_ID                    : in     String := "") is
      ----------------------------------------------------------------------------

      begin
         Log (Debug, Here, Who & " enter title '" & Tab_Title & "' select " & Select_Card'img);
         Card.Create (Connection_Data.Cards, Card_ID);

         Connection_Data.Cards.Add_Card (
            Name => Tab_Title,
            Card => Card);
         Connection_Data.Tabs.Add_Tab (Tab_Title, Tab_Title, Selected => Select_Card);
         Log (Debug, Here, Who & " exit");
      end Add_Card;

      ----------------------------------------------------------------------------
      function Did_Exit (
         Connection_Data            : in out Generic_Connection_Data_Type
      ) return Boolean is
      ----------------------------------------------------------------------------

      begin
         return Connection_Data.Exit_Occured.Test;
      end Did_Exit;

      ----------------------------------------------------------------------------
      function Find_Card (
         Connection_Data            : in     Generic_Connection_Data_Type;
         ID                         : in     String
      ) return Gnoga.Gui.Element.Pointer_To_Element_Class is
      ----------------------------------------------------------------------------

      begin
         return Connection_Data.Cards.Element (ID);

      exception
         when Fault: others =>
            Trace_Exception (Fault, Here, Who);
            raise Failed with "Could not find card '" & ID & "' at " & Here;
      end Find_Card;

      ----------------------------------------------------------------------------
      procedure Wait_For_Exit (
         Connection_Data            : in out Generic_Connection_Data_Type) is
      ----------------------------------------------------------------------------

      begin
         Connection_Data.Exit_Occured.Wait;
      end Wait_For_Exit;

      ----------------------------------------------------------------------------
      procedure Initialize_Dock (
         Connection_Data            : in out Generic_Connection_Data_Type;
         Title                      : in     String;
         HTTP_Port                  : in     Positive := 8080) is
      ----------------------------------------------------------------------------

      begin
         Log (Debug, Here, Who & " enter");
         Framework.Connection_Data_Type (Connection_Data).Initialize (
            Title, HTTP_Port);
         Log (Debug, Here, Who & " exit");
      end Initialize_Dock;

end Dock_Framework;

end Framework.Dock;
