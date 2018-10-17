with CAC.Trace; use CAC.Trace;
with Gnoga.GUI.Element;
--with Gnoga.GUI.Window;

package body Framework.Docker_View is

   ---------------------------------------------------------------
   procedure Add_Card (
      View                       : in out View_Type;
      Card                       : access Framework.View_Type;
      Name                       : in     String) is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter name: '" & Name & "'");
      View.Cards.Add_Card (Name, Card, Show => True);
      View.Tabs.Add_Tab (Name, Name, Selected => False);
   end Add_Card;

   ---------------------------------------------------------------
   procedure Create (
      View                       : in out View_Type;
      Parent                     : in out Gnoga.Gui.Base.Base_Type'Class;
      ID                         : in     String  := "") is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");
      Gnoga.Gui.View.View_Type (View).Create (Parent, ID);
      View.Window := Parent'unchecked_access;
      -- create a docker under main window to put everything else in
      View.Docker.Create (Parent, ID => "Docker");
      Log (Debug, Here, Who & " create panel");
      -- create a pannel in the docker
      View.Panel.Create (View.Docker, ID => "Panel");
      View.Panel.Visible (False);
      View.Panel.Background_Color ("silver");

      View.Docker.Top_Dock (View.Panel'Access);
      View.Docker.Top_Dock (View.Panel'Access);

      Log (Debug, Here, Who & " create deck");
      -- create a deck to put cards in
      View.Deck.Create (View.Docker, ID => "Deck");
      -- put the deck in the docker
      View.Docker.Fill_Dock (View.Deck'Access);

      Log (Debug, Here, Who & " create cards");
      View.Cards.Create (View.Deck, ID => "Cards");
      View.Cards.Border;
      View.Deck.Fill_Dock (View.Cards'Access);

      Log (Debug, Here, Who & " create tabs");
      View.Tabs.Create (Parent    => View.Deck,
                       Card_View => View.Cards,
                       ID        => "Tabs");

      Log (Debug, Here, Who & " connect history widget");
      Log (Debug, Here, Who & "add values card");


      Log (Debug, Here, Who & " set top dock");

      View.Cards.Position (Gnoga.GUI.Element.Absolute);
      View.Cards.Top (45, "px");
      View.Tabs.Position (Gnoga.GUI.Element.Absolute);
      View.Tabs.Top (15, "px");

      View.Panel.Visible (True);
      Log (Debug, Here, Who & " exit");

   exception
      when Fault: others =>
         Trace_Exception (Fault, Here, "could not create View");
         raise;

   end Create;

end Framework.Docker_View;
