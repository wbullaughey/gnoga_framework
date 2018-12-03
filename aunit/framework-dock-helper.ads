--with Docker_Tests;

package Framework.Dock.Helper is

   procedure Initialize_Docker_Test (
      Connection_Data            : in out Connection_Data_Type'class);

   procedure Initialize_Table_Test (
      Connection_Data            : in out Connection_Data_Type'class);

   procedure Press_Exit (
      Object                     : in    Gnoga.Gui.Base.Pointer_To_Base_Class);

end Framework.Dock.Helper;
