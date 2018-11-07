with Docker_Tests;

package Dock.Helper is

   procedure Initialize (
      Connection_Data            : in out Docker_Tests.Connection_Data_Type);

   procedure Press_Exit (
      Object                     : in    Gnoga.Gui.Base.Pointer_To_Base_Class);

end Dock.Helper;
