with Ada.Strings.Hash;
with Ada.Task_Identification;
with Gnoga.Application.Multi_Connect;
with Gnoga.Gui.Base;
with Gnoga.Gui.View;
with Ada.Strings.Unbounded;
with Gnoga.GUI.Window;
with Gnoga.Types;

package Framework is

   Failed                        : exception;

   type Connection_Type          is new Gnoga.Types.Connection_Data_Type with private;
   type Connection_Class_Access  is access all Connection_Type'class;
   subtype Unbounded_String      is Ada.Strings.Unbounded.Unbounded_String;

   type View_Type                is new Gnoga.Gui.View.View_Type with private;
   type View_Class_Access        is access all View_Type'class;

   Debug                         : Boolean := False;
   Verbose                       : Boolean := False;

   procedure Connection_Handler (             -- handle new connection from browser
      Connection                 : in out Connection_Type;
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class);

   function Coerce (
      Source                     : in     String
   ) return Unbounded_String renames Ada.Strings.Unbounded.To_Unbounded_String;

   function Coerce (
      Source                     : in     Unbounded_String
   ) return String renames Ada.Strings.Unbounded.To_String;

   procedure Create (
      Connection                 : in     Connection_Class_Access;
      Connection_ID              : in     String;
      View                       : in     View_Class_Access;
      Application_Connection_Handler
                                 : in     Gnoga.Application.Multi_Connect.Application_Connect_Event;
      Title                      : in     String;
      HTTP_Port                  : in     Positive := 8080);

   function Get_Connection (
      Connection_ID           : in     String
   ) return Connection_Class_Access;

   procedure Run (
      Connection                 : in out Connection_Type);

   procedure Stop (
         Connection              : in out Connection_Type);

private

   type View_Type                is new Gnoga.Gui.View.View_Type with record
      Window                     : access Gnoga.Gui.Base.Base_Type'class;
   end record;

   task type Message_Loop_Task is

      entry Start (
         Connection_Pointer      : in     Connection_Class_Access);

   end Message_Loop_Task;

   type Message_Loop_Task_Task_Access
                                 is access Message_Loop_Task;

   type Connection_Type          is new Gnoga.Types.Connection_Data_Type with record
      HTTP_Port                  : Positive;
      Id                         : Unbounded_String;
      Message_Loop               : Message_Loop_Task_Task_Access := Null;
      Task_Id                    : Ada.Task_Identification.Task_Id := Ada.Task_Identification.Null_Task_Id;
      View                       : View_Class_Access;
      Window_Connected           : Boolean := False;
   end record;

end Framework;
