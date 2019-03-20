--with Framework.Dock_Base;
with Gnoga.Gui.Base;
with Gnoga.Gui.View.Docker;

package Framework.Nested_Docker is

   type Nested_Docker_Type       is new Gnoga.Gui.View.View_Type with private;
                                 -- generice view type containing a Docker_View_Type

   type Docker_Class_Access      is access all Nested_Docker_Type'class;

   procedure Create (
      Nested_Docker              : in out Nested_Docker_Type;
      Parent                     : access Gnoga.Gui.Base.Base_Type'Class;
      ID                         : in     String  := "");

   function Inner (
      Nested_Docker              : in out Nested_Docker_Type
-- ) return access Gnoga.Gui.View.Docker.Docker_View_Type'Class;
   ) return access Gnoga.Gui.View.View_Type'Class;

   procedure Top_Dock (
      Nested_Docker              : in out Nested_Docker_Type;
      Dock                       : access Gnoga.Gui.View.View_Base_Type'Class);

private
   type Nested_Docker_Type       is new Gnoga.Gui.View.View_Type with record
      Docker                     : aliased Gnoga.Gui.View.Docker.Docker_View_Type;
      Parent                     : access Gnoga.Gui.Base.Base_Type'Class;
   end record;

end Framework.Nested_Docker;
