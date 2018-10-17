package body Tabbed_Window_Framework is

   procedure Create (
      Connection                 : in     Connection_Class_Access;
      Connection_ID              : in     String;
      Widget                     : in     Widget_Class_Access;
      Application_Connection_Handler
                                 : in     Gnoga.Application.Multi_Connect.Application_Connect_Event;
      Title                      : in     String;
      HTTP_Port                  : in     Positive := 8080);

   ---------------------------------------------------------------
   procedure Connection_Handler (             -- handle new connection from browser
      Main_Window    : in out Gnoga.Gui.Window.Window_Type'Class;
      Connection     : access Gnoga.Application.Multi_Connect.Connection_Holder_Type) is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");

      declare
         Connection_Data         : constant Connection_Class_Access :=
                                    Connection_Class_Access (Framework.Get_Connection (Connection_ID));

      begin
         Connection_Data.Connection_Handler (Main_Window);
         Create (Connection,
      end;

      Log (Debug, Here, Who & " exit");
   end Connection_Handler;

   ---------------------------------------------------------------
   procedure Create (
      Connection                 : in     Connection_Class_Access;
      Connection_ID              : in     String;
      Widget                     : in     Widget_Class_Access;
      Application_Connection_Handler
                                 : in     Gnoga.Application.Multi_Connect.Application_Connect_Event;
      Title                      : in     String;
      HTTP_Port                  : in     Positive := 8080) is
   ---------------------------------------------------------------

   begin
null;
   end Create;

end Tabbed_Window_Framework;


