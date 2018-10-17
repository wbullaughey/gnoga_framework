with Ada.Calendar;
with Ada.Task_Identification;
with Ada.Unchecked_Deallocation;
with CAC.Trace.Tasks; use CAC.Trace; use CAC.Trace.Tasks;
--with DB_View.Controller;
--with Gnoga.Application.Multi_Connect;
--with Gnoga.Server.Connection;

package body DB_View.GNOGA_Lib is

   task type Message_Loop_Task;

   type Message_Loop_Access      is access Message_Loop_Task;

   use type Ada.Calendar.Time;
   use type Ada.Task_Identification.Task_Id;
   use type Gnoga.GUI.Window.Pointer_To_Window_Class;

   procedure Free is new Ada.Unchecked_Deallocation (
        Object          => Message_Loop_Task,
        Name            => Message_Loop_Access);

   GNOGA_Initialized             : Boolean := False;
   Message_Loop                  : Message_Loop_Access := Null;
   Task_Id                       : Ada.Task_Identification.Task_Id := Ada.Task_Identification.Null_Task_Id;

   ---------------------------------   ---------------------------------------------------------------
   procedure Initialize_GNOGA (
      Handler                    : in     Gnoga.Application.Multi_Connect.Application_Connect_Event;
      Start_Message_Loop         : in     Boolean := True) is   -- makes sure only done once
   ---------------------------------------------------------------

   begin
      if not GNOGA_Initialized then
         Log (Debug, Here, Who);
         Standard.Gnoga.Application.Multi_Connect.Initialize (
            Event=> Handler,
            Port => HTTP_Port,
            Boot => "boot_jqueryui.html");
         GNOGA_Initialized := True;
      end if;

      if Start_Message_Loop and Message_Loop = Null then
         Message_Loop := new Message_Loop_Task;

         while Task_ID = Ada.Task_Identification.Null_Task_Id loop
            Log (Debug, Here, Who & " wait for task to initialize");
            delay 0.1;  -- let task initialize
         end loop;
      end if;
      Log (Debug, Here, Who & " exit");
   end Initialize_GNOGA;

   ---------------------------------------------------------------
   procedure Terminate_GNOGA is
   ---------------------------------------------------------------

   begin
      if GNOGA_Initialized then
         Log (Debug, Here, Who);
         GNOGA_Initialized := False;
--       if DB_View.AUnit_Main_Window /= Null then
--          Gnoga.Server.Connection.Close (DB_View.AUnit_Main_Window.Connection_ID);
--       end if;
         Standard.Gnoga.Application.Multi_Connect.End_Application;
         delay 1.0;
         Log (Debug, Here, Who);
      end if;

      if Message_Loop /= Null then
         Log (Debug, Here, Who);

         declare
            Timeout              : constant Ada.Calendar.Time := Ada.Calendar.Clock + 5.0;

         begin
            while not Ada.Task_Identification.Is_Terminated (Task_Id) loop
               delay 0.1;
               if Ada.Calendar.Clock > Timeout then
                  Log (Debug, Here, Who);
                  raise Failed with "Message Loop task failed to terminate";
               end if;
            end loop;
         end;

         Free (Message_Loop);
         Message_Loop := Null;
         Task_ID := Ada.Task_Identification.Null_Task_Id;
         Log (Debug, Here, Who);
      end if;
   end Terminate_GNOGA;

   ---------------------------------------------------------------
   protected body Termination is

      ------------------------------------------------------------
      procedure Set_Terminated is
      ------------------------------------------------------------

      begin
         Done := True;
      end Set_Terminated;

      ------------------------------------------------------------
      entry Terminated when Done is
      ------------------------------------------------------------

      begin
         return;
      end Terminated;

   end Termination;

   ---------------------------------------------------------------
   task body Message_Loop_Task is
   begin
      Tasks.Start ("message loop task", Here);
      Log (Debug, Here, Who);
      Task_ID := Ada.Task_Identification.Current_Task;
      Standard.Gnoga.Application.Multi_Connect.Message_Loop;
      Log (Debug, Here, Who);
      Tasks.Stop;

   exception
      when Fault: others =>
         Trace_Exception (Fault, Here, Who);
         raise;

   end Message_Loop_Task;

end DB_View.GNOGA_Lib;
