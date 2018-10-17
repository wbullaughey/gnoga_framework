with Gnoga.Application.Multi_Connect;
with Gnoga.Gui.Window;

package Widget is

   procedure Connection_Handler (             -- handle new connection from browser
      Main_Window    : in out Gnoga.Gui.Window.Window_Type'Class;
      Connection     : access Gnoga.Application.Multi_Connect.Connection_Holder_Type);

end Widget;
