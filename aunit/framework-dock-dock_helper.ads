--with Framework.Dock;
--with Framework.Dock_Base;

generic
package Framework.Dock.Dock_Helper is

   procedure Press_Exit (
      Connection_Data            : in out Dock_Connection_Data_Type'class);

end Framework.Dock.Dock_Helper;
