with Ada.Calendar;
with Ada.Containers.Indefinite_Hashed_Maps;
--with Ada.Tags;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_Deallocation;
with CAC.OS;
with CAC.Trace.Tasks; use CAC.Trace; -- use CAC.Trace.Tasks;
with Gnoga.Application.Multi_Connect;
with Strings;

package body Framework is

   use type Ada.Task_Identification.Task_Id;
   use type Ada.Calendar.Time;
-- use type Gnoga.Gui.View.Card.Pointer_To_Card_View_Class;

   package Connection_Table_Package is new Ada.Containers.Indefinite_Hashed_Maps (
      Key_Type       => String,
      Element_Type   => Connection_Data_Class_Access,
      Hash           => Ada.Strings.Hash,
      Equivalent_Keys=> "=",
      "="            => "=");

   procedure Free is new Ada.Unchecked_Deallocation (
      Object         => Message_Loop_Task,
      Name           => Message_Loop_Task_Task_Access);

   procedure On_Connect (
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class;
      Connection                 : access Gnoga.Application.Multi_Connect.Connection_Holder_Type);

   Connection_Table              : Connection_Table_Package.Map;


   ---------------------------------------------------------------
   procedure Faital_Error (
      Connection_Data            : in out Connection_Data_Type;
      Here                       : in     String;
      Who                        : in     String;
      Message                    : in     String) is
   ---------------------------------------------------------------

      Line                       : constant String := "Application encountered a fatal error at " &
                                    Here & " in " & Who & ". Message: " & Message;
   begin
      GNOGA.GUI.Window.Alert (Connection_Data.Main_Window.all, Line);
      Put_Line (Line);
      CAC.OS.Immediate_Halt (0);
   end Faital_Error;

   ---------------------------------------------------------------
   function Get_Connection (
      Connection_ID              : in     String := Main_Connection_ID
   ) return Connection_Data_Class_Access is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who);
      return Connection_Table.Element (Connection_ID);

   exception
      when Fault: Constraint_Error =>
         Trace_Exception (Fault, Here, Who & " could not find  '" & Connection_ID & "'");
         raise Failed with "Connection Data not found for '" & Connection_ID & "'";

   end Get_Connection;

   ---------------------------------------------------------------
   function Get_Window (
      Connection                 : in     Connection_Data_Type
   ) return access Gnoga.Gui.Window.Window_Type'Class is
   ---------------------------------------------------------------

   begin
      return Connection.Main_Window;
   end Get_Window;

   ---------------------------------------------------------------
   procedure Initialize (
      Connection                 : in out Connection_Data_Type) is
   pragma Unreferenced (Connection);
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who);
   end Initialize;

   ---------------------------------------------------------------
   procedure Initialize (
      Connection                 : in out Connection_Data_Type;
      Title                      : in     String;
      HTTP_Port                  : in     Positive := 8080) is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");
      Connection_Data_Type'class (Connection).Initialize;   -- explicit redispatch
      GNOGA.Application.Title (Title);
      GNOGA.Application.HTML_On_Close
        ("<b>Connection to Application has been terminated</b>");

      Connection.HTTP_Port := HTTP_Port;
      Connection.Id := Coerce (Main_Connection_ID);
      Connection.Message_Loop := new Message_Loop_Task;
      Connection_Table.Insert (Main_Connection_ID, Connection'unchecked_access);

      Standard.Gnoga.Application.Multi_Connect.Initialize (
         Event=> On_Connect'access,
         Port => HTTP_Port);

      Connection.Message_Loop.Start (Connection'unchecked_access);

      while Connection.Task_ID = Ada.Task_Identification.Null_Task_Id loop
         Log (Debug, Here, Who & " wait for task to initialize");
         delay 0.1;  -- let task initialize
      end loop;

      Log (Debug, Here, Who & " exit");
   end Initialize;

   ----------------------------------------------------------------------------
   procedure On_Connect (
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class;
      Connection                 : access Gnoga.Application.Multi_Connect.Connection_Holder_Type) is
   pragma Unreferenced (Connection);
   ----------------------------------------------------------------------------

      Connection_Data            : constant Connection_Data_Class_Access :=
                                    Get_Connection;
   begin
      Log (Debug, Here, Who & " enter");
      Main_Window.Connection_Data (Connection_Data, False); -- connect Connection_Data with Window
      Connection_Data.Main_Window := Main_Window'unchecked_access;
      Connection_Data.Connection_Handler (Main_Window);
      Log (Debug, Here, Who & " exit");

   exception
      when Fault: others =>
         Trace_Exception (Fault, Here, Who);
         raise;

   end On_Connect;

   ----------------------------------------------------------------------------
   function Parent (
      Connection_Data            : in out Connection_Data_Type
   ) return Gnoga.Gui.View.Card.Pointer_To_Card_View_Class is
   pragma Unreferenced (Connection_Data);
   ----------------------------------------------------------------------------

   begin
      Log (Debug, Here, Who);
      raise Failed with "Parent not implemented";
      return Null;
   end Parent;

   ---------------------------------------------------------------
   procedure Run (
      Connection              : in out Connection_Data_Type) is
   ---------------------------------------------------------------

      Timeout                 : constant Ada.Calendar.Time := Ada.Calendar.Clock + 5.0;

   begin
      Log (Debug, Here, Who & " enter");
      begin
         GNOGA.Application.Open_URL (
            "http://127.0.0.1:" & Strings.Trim (Connection.HTTP_Port'img));

         while Ada.Calendar.Clock < Timeout loop
            if Connection.Main_Window /= Null then
               Log (Debug, Here, Who & " exit");
               return;
            end if;
         end loop;
         Log (Here, Who & " timeout waiting for Connection Main_Window to be set");

      exception
         when Fault: others =>
            Trace_Exception (Fault, Here, Who);
            raise;
      end;

      raise Failed with " window not connected";
   end Run;

   ---------------------------------------------------------------
   procedure Set_Connection (
      Connection                 : in     Connection_Data_Class_Access;
      Connection_ID              : in     String) is
   ---------------------------------------------------------------

   begin
      Connection_Table.Insert (Connection_ID, Connection);
   end Set_Connection;

   ---------------------------------------------------------------
   procedure Set_Window (
      Connection                 : in out Connection_Data_Type;
      Window                     : access Gnoga.Gui.Window.Window_Type'Class) is
   ---------------------------------------------------------------

   begin
      Connection.Main_Window := Window;
   end Set_Window;

   ---------------------------------------------------------------
   procedure Stop (
      Connection              : in out Connection_Data_Type) is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");

      Standard.Gnoga.Application.Multi_Connect.End_Application;

--    delay 1.0;

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
      end if;

      Connection_Table.Delete (Coerce (Connection.ID));

      Log (Debug, Here, Who & " exit");
   end Stop;

   ---------------------------------------------------------------
   task body Message_Loop_Task is

      Connection              : access Connection_Data_Type;

   begin
      accept Start (
         Connection_Pointer   : in     Connection_Data_Class_Access) do

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
