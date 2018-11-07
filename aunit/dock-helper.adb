with CAC.Trace; use CAC.Trace;

package body Dock.Helper is

   procedure On_Create (
      Object                     : in out Gnoga.Gui.Base.Base_Type'Class);

   ---------------------------------------------------------------
   procedure Initialize (
      Connection_Data            : in out Docker_Tests.Connection_Data_Type) is
   ---------------------------------------------------------------

   begin
      Connection_Data.Exit_Button.On_Create_Handler (On_Create'access);
   end Initialize;

   ---------------------------------------------------------------
   procedure On_Create (
      Object                     : in out Gnoga.Gui.Base.Base_Type'Class) is
   ---------------------------------------------------------------

      Connection_Data            : constant Docker_Tests.Connection_Class_Access :=
                                    Docker_Tests.Connection_Class_Access (Framework.Get_Connection (Connection_ID));
   begin
      Log (Debug, Here, Who & " enter");
      Connection_Data.Object := Object'unchecked_access;
   end On_Create;

   ---------------------------------------------------------------
   procedure Press_Exit (
      Object                     : in    Gnoga.Gui.Base.Pointer_To_Base_Class) is
   ---------------------------------------------------------------

   begin
log (here, who);
      On_Exit (Object.all);
   end Press_Exit;
end Dock.Helper;
