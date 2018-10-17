with Ada.Containers.Indefinite_Hashed_Maps;
with Ada.Strings.Hash;
with Ada.Task_Identification;
with Gnoga.Application.Multi_Connect;
with Gnoga.Gui.View;
with Gnoga.GUI.Window;
with Gnoga.Types;

generic
   type Abstract_Connection_Type is new Gnoga.Types.Connection_Data_Type with private;
   type Abstract_Widget_Type is new Gnoga.Gui.View.View_Type with private;
   Application_Connection_Handler
                              : in     Gnoga.Application.Multi_Connect.Application_Connect_Event;
   Connection_ID              : in     String;
   Title                      : in     String;

package Framework is

   Failed                        : exception;

   Debug                         : Boolean := False;
   Verbose                       : Boolean := False;

   type Connection_Type       is new Abstract_Connection_Type with private;

   type Connection_Class_Access
                              is access all Connection_Type'class;

   type Widget_Type is new Abstract_Widget_Type with private;

-- procedure Connect_Window (
--    Connection              : in out Connection_Type;
--    Window                  : in out Gnoga.Gui.Window.Window_Type'Class);
--
-- function Connect_Window (
--    Connection_ID           : in     String;
--    Window                  : in out Gnoga.Gui.Window.Window_Type'Class
-- ) return Connection_Class_Access;

   procedure Create (
      Connection              : in     Connection_Class_Access;
      HTTP_Port               : in     Positive := 8080);

   function Get_Connection return Connection_Class_Access;

   procedure Run (
      Connection              : in out Connection_Type);

   procedure Stop (
      Connection              : in out Connection_Type);

private
   package Connection_Table_Package is new Ada.Containers.Indefinite_Hashed_Maps (
      Key_Type       => String,
      Element_Type   => Connection_Class_Access,
      Hash           => Ada.Strings.Hash,
      Equivalent_Keys=> "=",
      "="            => "=");

   type Widget_Type is new Abstract_Widget_Type with record
      Window                  : access Gnoga.GUI.Window.Window_Type'Class;
   end record;

   task type Message_Loop_Task is

      entry Start (
         Connection_Pointer   : in     Connection_Class_Access);

   end Message_Loop_Task;

   type Connection_Type       is new Abstract_Connection_Type with record
      Connection_Handler      : Gnoga.Application.Multi_Connect.Application_Connect_Event;
      Message_Loop            : Message_Loop_Task;
      Task_Id                 : Ada.Task_Identification.Task_Id := Ada.Task_Identification.Null_Task_Id;
      Widget                  : Widget_Type;
      Window_Connected        : Boolean := False;
   end record;

   procedure Connection_Handler (             -- handle new connection from browser
      Main_Window    : in out Gnoga.Gui.Window.Window_Type'Class;
      Holder         : access Gnoga.Application.Multi_Connect.Connection_Holder_Type);

end Framework;
