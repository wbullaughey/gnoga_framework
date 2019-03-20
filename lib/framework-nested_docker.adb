with CAC.Trace; use CAC.Trace;

package body Framework.Nested_Docker is

   ----------------------------------------------------------------------------
   procedure Create (
      Nested_Docker              : in out Nested_Docker_Type;
      Parent                     : access Gnoga.Gui.Base.Base_Type'Class;
      ID                         : in     String  := "") is
   ----------------------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");
      Gnoga.Gui.View.View_Type (Nested_Docker).Create (Parent.all, ID);
      Nested_Docker.Docker.Create (Nested_Docker, "nested docker " & ID);
      Nested_Docker.Parent := Parent;
      Log (Debug, Here, Who & " exit");
   end Create;

   ----------------------------------------------------------------------------
-- overriding
   function Inner (
      Nested_Docker              : in out Nested_Docker_Type
-- ) return access Gnoga.Gui.View.Docker.Docker_View_Type'Class is
   ) return access Gnoga.Gui.View.View_Type'Class is
   ----------------------------------------------------------------------------

   begin
      return Nested_Docker.Docker'unchecked_access;
   end Inner;

   ----------------------------------------------------------------------------
   procedure Top_Dock (
      Nested_Docker              : in out Nested_Docker_Type;
      Dock                       : access Gnoga.Gui.View.View_Base_Type'Class) is
   ----------------------------------------------------------------------------

   begin
      null;
--    Nested_Docker.Docker.Top_Dock (Dock);
   end Top_Dock;

end Framework.Nested_Docker;
