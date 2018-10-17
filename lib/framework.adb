with Ada.Calendar;
with Ada.Containers.Indefinite_Hashed_Maps;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_Deallocation;
with CAC.Trace.Tasks; use CAC.Trace; use CAC.Trace.Tasks;
with Strings;

package body Framework is

   use type Ada.Task_Identification.Task_Id;
   use type Ada.Calendar.Time;

   package Connection_Table_Package is new Ada.Containers.Indefinite_Hashed_Maps (
      Key_Type       => String,
      Element_Type   => Connection_Class_Access,
      Hash           => Ada.Strings.Hash,
      Equivalent_Keys=> "=",
      "="            => "=");

   procedure Free is new Ada.Unchecked_Deallocation (
      Object         => Message_Loop_Task,
      Name           => Message_Loop_Task_Task_Access);

   Connection_Table           : Connection_Table_Package.Map;

   ---------------------------------------------------------------
   procedure Connection_Handler (             -- handle new connection from browser
      Connection                 : in out Connection_Type;
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class) is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");
      Main_Window.Connection_Data (Connection'unchecked_access, False);
      Connection.Window_Connected := True;
      Log (Debug, Here, Who & " exit");
   end Connection_Handler;

   ---------------------------------------------------------------
   procedure Create (
      Connection                 : in     Connection_Class_Access;
      Connection_ID              : in     String;
      View                       : in     View_Class_Access;
      Application_Connection_Handler
                                 : in     Gnoga.Application.Multi_Connect.Application_Connect_Event;
      Title                      : in     String;
      HTTP_Port                  : in     Positive := 8080) is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");
      GNOGA.Application.Title (Title);
      GNOGA.Application.HTML_On_Close
        ("<b>Connection to Application has been terminated</b>");

      Connection.HTTP_Port := HTTP_Port;
      Connection.Id := Coerce (Connection_Id);
      Connection.Message_Loop := new Message_Loop_Task;
      Connection.Message_Loop.Start (Connection);
      Connection.View := View;
      Connection_Table.Insert (Connection_ID, Connection);

      Standard.Gnoga.Application.Multi_Connect.Initialize (
         Event=> Application_Connection_Handler,
         Port => HTTP_Port,
         Boot => "boot_jqueryui.html");

      while Connection.Task_ID = Ada.Task_Identification.Null_Task_Id loop
         Log (Debug, Here, Who & " wait for task to initialize");
         delay 0.1;  -- let task initialize
      end loop;

      Log (Debug, Here, Who & " exit");
   end Create;

   ---------------------------------------------------------------
   function Get_Connection (
      Connection_ID           : in     String
-- ) return access Connection_Type is
-- ) return access Connection_Type'class is
   ) return Connection_Class_Access is
   ---------------------------------------------------------------

   begin
      return Connection_Table.Element (Connection_ID);

   exception
      when Fault: Constraint_Error =>
         Trace_Exception (Fault, Here, Who & " could not find  '" & Connection_ID & "'");
         raise Failed with "Connection Data not found for '" & Connection_ID & "'";

   end Get_Connection;

   ---------------------------------------------------------------
   procedure Run (
      Connection              : in out Connection_Type) is
   ---------------------------------------------------------------

      Timeout                 : constant Ada.Calendar.Time := Ada.Calendar.Clock + 5.0;

   begin
      Log (Debug, Here, Who & " enter");
      GNOGA.Application.Open_URL (
         "http://127.0.0.1:" & Strings.Trim (Connection.HTTP_Port'img));

      while Ada.Calendar.Clock < Timeout loop
         if Connection.Window_Connected then
            Log (Debug, Here, Who & " exit");
            return;
         end if;
      end loop;

      raise Failed with " window not connected";
   end Run;

   ---------------------------------------------------------------
   procedure Stop (
      Connection              : in out Connection_Type) is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");

      Standard.Gnoga.Application.Multi_Connect.End_Application;
--       Connection.Message_Loop.Stop;

      delay 1.0;

--       if Connection.Message_Loop = Null then
--          Put_Line ("Framework not created");
--       else
         if Connection.Task_ID = Ada.Task_Identification.Null_Task_Id then
            Put_Line ("Message loop task not started");
         else
            declare
               Timeout              : constant Ada.Calendar.Time := Ada.Calendar.Clock + 5.0;

            begin
               while not Ada.Task_Identification.Is_Terminated (Connection.Task_Id) loop
                  delay 0.1;
                  if Ada.Calendar.Clock > Timeout then
                     Log (Debug, Here, Who);
                     raise Failed with "Message Loop task failed to terminate";
                  end if;
               end loop;
            end;

            Free (Connection.Message_Loop);
            Connection.Task_ID := Ada.Task_Identification.Null_Task_Id;
--          end if;
      end if;

      Connection_Table.Delete (Coerce (Connection.ID));

      Log (Debug, Here, Who & " exit");
   end Stop;

   ---------------------------------------------------------------
   task body Message_Loop_Task is

      Connection              : access Connection_Type;

   begin
      accept Start (
         Connection_Pointer   : in     Connection_Class_Access) do

         Connection := Connection_Pointer;
      end Start;

      Log (Debug, Here, Who & " enter");
      Tasks.Start ("message loop task", Here);
      Connection.Task_ID := Ada.Task_Identification.Current_Task;
      Gnoga.Application.Multi_Connect.Message_Loop;
      Log (Debug, Here, Who & " exit");
      Tasks.Stop;

   exception
      when Fault: others =>
         Trace_Exception (Fault, Here, Who);
         raise;

   end Message_Loop_Task;

end Framework;
