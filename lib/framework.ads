with Ada.Strings.Hash;
with Ada.Task_Identification;
--with Gnoga.Application.Multi_Connect;
--with Gnoga.Gui.Base;
with Gnoga.Gui.View.Card;
with Ada.Strings.Unbounded;
with Gnoga.GUI.Window;
with Gnoga.Types;

package Framework is

   Failed                        : exception;

   type Connection_Data_Type     is abstract new Gnoga.Types.Connection_Data_Type with private;
   type Connection_Data_Class_Access
                                 is access all Connection_Data_Type'class;
   subtype Unbounded_String      is Ada.Strings.Unbounded.Unbounded_String;

   Debug                         : Boolean := False;
   Main_Connection_ID            : constant String := "framework";
   Verbose                       : Boolean := False;

   procedure Connection_Handler (             -- handle new connection from browser
      Connection_Data            : in out Connection_Data_Type;
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class) is abstract;

   function Coerce (
      Source                     : in     String
   ) return Unbounded_String renames Ada.Strings.Unbounded.To_Unbounded_String;

   function Coerce (
      Source                     : in     Unbounded_String
   ) return String renames Ada.Strings.Unbounded.To_String;

   procedure Faital_Error (
      Connection_Data            : in out Connection_Data_Type;
      Here                       : in     String;
      Who                        : in     String;
      Message                    : in     String);

   function Get_Connection (
      Connection_ID              : in     String := Main_Connection_ID
   ) return Connection_Data_Class_Access;

   function Get_Window (
      Connection                 : in     Connection_Data_Type
   ) return access Gnoga.Gui.Window.Window_Type'Class;

   procedure Initialize (
      Connection                 : in out Connection_Data_Type);

   procedure Initialize (
      Connection                 : in out Connection_Data_Type;
      Title                      : in     String;
      HTTP_Port                  : in     Positive := 8080);

   function Parent (
      Connection_Data            : in out Connection_Data_Type
   ) return Gnoga.Gui.View.Card.Pointer_To_Card_View_Class;

   procedure Run (
      Connection                 : in out Connection_Data_Type);

   procedure Set_Connection (
      Connection                 : in     Connection_Data_Class_Access;
      Connection_ID              : in     String);

   procedure Set_Window (
      Connection                 : in out Connection_Data_Type;
      Window                     : access Gnoga.Gui.Window.Window_Type'Class);

   procedure Stop (
      Connection                 : in out Connection_Data_Type);

private

   task type Message_Loop_Task is

      entry Start (
         Connection_Pointer      : in     Connection_Data_Class_Access);

   end Message_Loop_Task;

   type Message_Loop_Task_Task_Access
                                 is access Message_Loop_Task;

   type Connection_Data_Type     is abstract new Gnoga.Types.Connection_Data_Type with record
      HTTP_Port                  : Positive;
      Id                         : Unbounded_String;
      Main_Window                : access Gnoga.Gui.Window.Window_Type'Class := Null;
      Message_Loop               : Message_Loop_Task_Task_Access := Null;
      Task_Id                    : Ada.Task_Identification.Task_Id := Ada.Task_Identification.Null_Task_Id;
   end record;

end Framework;
