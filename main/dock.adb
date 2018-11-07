with CAC.Trace; use CAC.Trace;
--with Gnoga.Application.Multi_Connect;
--with Gnoga.Gui.Base;

package body Dock is

   ----------------------------------------------------------------------------
   procedure Add_Card (
      Connection_Data            : in out Connection_Data_Type;
      Tab_Title                  : in     String;
      Card                       : access Gnoga.Gui.View.View_Type'class;
      Select_Card                : in     Boolean) is
   ----------------------------------------------------------------------------

   begin
      Connection_Data.Cards.Add_Card (
         Name => Tab_Title,
         Card => Card);
      Connection_Data.Tabs.Add_Tab (Tab_Title, Tab_Title, Selected => Select_Card);
   end Add_Card;

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

      Connection_Data.Dock.Create (Connection_Data.Docker, "Dock");
      Connection_Data.Dock.Border;
      Connection_Data.Docker.Fill_Dock (Connection_Data.Dock'Access);

      Connection_Data.Table.Create (Connection_Data.Dock, "table");
      Connection_Data.Table.Border;
      Connection_Data.Dock.Top_Dock (Connection_Data.Table'Access);
--    Connection_Data.Table.Position (Gnoga.Gui.Element.Relative);

      Connection_Data.Deck.Create (Connection_Data.Dock, "Deck");
      Connection_Data.Deck.Border;
      Connection_Data.Dock.Fill_Dock (Connection_Data.Deck'Access);
--    Connection_Data.Deck.Position (Gnoga.Gui.Element.Relative);

      Connection_Data.Cards.Create (Connection_Data.Deck, "Cards");
      Connection_Data.Cards.Border;
      Connection_Data.Deck.Fill_Dock (Connection_Data.Cards'Access);

      Connection_Data.Tabs.Create (Parent    => Connection_Data.Deck,
                          Card_View => Connection_Data.Cards,
                          ID => "Tabs");
      Connection_Data.Tabs.Add_Tab ("test card", "test tab", Selected => True);

--    Connection_Data.My_Widget_1.Create (Connection_Data.Cards, "My_Widget_1");
--    Connection_Data.My_Widget_1.Widget_Form.Action ("/result");
--    Connection_Data.Cards.Add_Card (Name => "Widget_1",
--                           Card => Connection_Data.My_Widget_1'Access);
--    Connection_Data.Tabs.Add_Tab ("Widget_1", "Static Form", Selected => True);
--
--    Connection_Data.My_Widget_2.Create (Connection_Data.Cards, "My_Widget_2");
--    Connection_Data.My_Widget_2.Widget_Form.On_Submit_Handler
--      (On_Submit'Unrestricted_Access);
--    Connection_Data.Cards.Add_Card (Name => "Widget_2",
--                           Card => Connection_Data.My_Widget_2'Access);
--    Connection_Data.Tabs.Add_Tab ("Widget_2", "Interactive Form");
--
--    Connection_Data.My_Results.Create (Connection_Data.Cards, "My_Results");
--    Connection_Data.Cards.Add_Card (Name => "Results",
--                           Card => Connection_Data.My_Results'Access);
--    Connection_Data.Tabs.Add_Tab ("Results", "Interactive Results");

      Connection_Data.Deck.Top_Dock (Connection_Data.Tabs'Access);
      --  We wait to dock Tabs until after we have added the tabs
      --  this ensures that Tabs's Height with content is known.
      Log (Debug, Here, Who & " exit");
   end Connection_Handler;

   ----------------------------------------------------------------------------
   procedure On_Connect (
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class;
      Connection                 : access Gnoga.Application.Multi_Connect.Connection_Holder_Type) is
   pragma Unreferenced (Connection);
   ----------------------------------------------------------------------------

      Connection_Data            : constant Connection_Data_Class_Access := Connection_Data_Class_Access (
                                    Framework.Get_Connection (Connection_ID));
   begin
      Log (Debug, Here, Who & " enter");
      Connection_Data.Connection_Handler (Main_Window);
      Log (Debug, Here, Who & " exit");
   end On_Connect;

   ----------------------------------------------------------------------------
   procedure On_Exit (
      Object                     : in out Gnoga.Gui.Base.Base_Type'Class) is
   ----------------------------------------------------------------------------

      Connection_Data            : constant Connection_Data_Class_Access := Connection_Data_Class_Access (
                                    Object.Connection_Data);
   begin
      Log (Debug, Here, Who & " enter");
      if Connection_Data = Null then
         raise Failed with "bad connection data";
      end if;

      Connection_Data.Exit_Occured.Set;
      Log (Debug, Here, Who & " exit");
   end On_Exit;
end Dock;
