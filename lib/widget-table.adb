with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_Deallocation;
with CAC.OS;
with CAC.Trace; use CAC.Trace;
--with Framework;
with Gnoga.Gui.Base;
--with Gnoga.GUI.Window;

package body Widget.Table is

    procedure Free_Row is new Ada.Unchecked_Deallocation (
        Object          => Row_Type'class,
        Name            => Row_Class_Access);

   procedure Table_Resize_Handler (
      Object                     : in out Gnoga.Gui.Base.Base_Type'Class);

   Connection_ID                 : constant String := "widget-table";

   ---------------------------------------------------------------
   procedure Add_Row (
      Table                      : in out Table_Type;
      Row                        : in     Row_Class_Access) is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");
      Table.Rows.Append (Row);
      Row.Create (Table.Table_Body);
      Log (Debug, Here, Who & " exit");
   end Add_Row;

   ---------------------------------------------------------------
   procedure Adjust_Table_Height (
      Table                      : in out Table_Type) is
   ---------------------------------------------------------------

      Parent                     : constant Gnoga.Gui.Base.Pointer_To_Base_Class :=
                                    Table.Table_Body.Parent;
      Height                     : constant Natural := Parent.Height - Table.Table_Offset;

   begin
      Log (Debug, Here, Who & "parent height" & Parent.Height'img &
         " table offset" & Table.Table_Offset'img & "height" & Height'img);
      Table.Table_Body.Height (Height);
   end Adjust_Table_Height;

   ---------------------------------------------------------------
   function Compare_Rows (
      Left, Right                : in     Row_Class_Access
   ) return Boolean is
   ---------------------------------------------------------------

   begin
      return Left = Right;
   end Compare_Rows;

   ---------------------------------------------------------------
   procedure Connection_Handler (             -- handle new connection from browser
      Connection_Data            : in out Connection_Data_Type;
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class) is
   pragma Unreferenced (Connection_Data, Main_Window);
   ---------------------------------------------------------------

   begin
      pragma Assert (False, "Connection_Handler in Widget.Table should not get called");
   end Connection_Handler;

-- ---------------------------------------------------------------
-- function Count (
--    Table                      : in     Table_Type
-- ) return Natural is
-- ---------------------------------------------------------------
--
-- begin
--    return Natural (Table.Rows.Length);
-- end Count;

   ---------------------------------------------------------------
   procedure Create (
      Table                      : in out Table_Type;
      Main_Window                : access Gnoga.Gui.Window.Window_Type'Class;
      Parent                     : in out Gnoga.Gui.View.View_Type'Class;
      Form                       : in out Gnoga.Gui.Element.Form.Form_Type'class;
      ID_Prefix                  : in     String;
      Header                     : access Row_Header_Type'class) is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " enter");
      Table.Connection_Data.Table := Table'unchecked_access;
      Framework.Set_Connection(Table.Connection_Data'unchecked_access, Connection_ID);
      Table.Form := Form'unchecked_access;
Log (Debug, Here, Who);
      Table.Set_Main_Window (Main_Window);
Log (Debug, Here, Who);
      Table.Create (Parent, ID_Prefix & "_table_dock");
--    Parent.Top_Dock (Table'Access);
--       Table.Style ("display", "block");
      Table.Box_Height (100, "%");
Log (Debug, Here, Who);
      Table.On_Resize_Handler (Table_Resize_Handler'access);

Log (Debug, Here, Who);
      Table.Table.Create (Form, ID_Prefix & "_table_id");
Log (Debug, Here, Who);
      Table.Table.Style ("display", "block");
--    Table.Table.Add_Caption ("docked table");
Log (Debug, Here, Who);
      Table.Table_Header.Create (Table.Table, "table header");
      Table.Table_Header_Row := Header;
Log (Debug, Here, Who);
      Table.Table_Header_Row.Create (Table.Table_Header, ID_Prefix & "_table_header_row");
Log (Debug, Here, Who);
      Table.Table_Body.Create (Table.Table, ID_Prefix & "_table Body");
      Table.Table_Body.Style ("display", "block");
      Table.Table_Body.Style ("overflow-y", "auto");
Log (Debug, Here, Who);

      Table.Table_Offset := Table.Table_Header.Height;
--       Table.Object.Height;

--Log (Debug, Here, Who);
--         Header.Create (Table.Table_Header, "table_header");
--
      Log (Debug, Here, Who & " table offset" & Table.Table_Offset'img);
      Log (Debug, Here, Who & " exit");

   exception
      when Fault: others =>
         Trace_Exception (Fault, Here, Who);

   end Create;

   ---------------------------------------------------------------
   procedure Delete_Row (
      Table                      : in out Table_Type;
      Index                      : in     Positive) is
   ---------------------------------------------------------------

      Row                        : Row_Class_Access := Table.Get_Row (Index);

   begin
      Row.Remove;                         -- remove row from DOM
      Table.Rows.Delete (Index);
      Free_Row (Row);
      Log (Debug, Here, Who & " row" & Index'img & " deleted");
   end Delete_Row;

   ---------------------------------------------------------------
   procedure Delete_Row (
      Table                      : in out Table_Type;
      ID                         : in     String) is
   ---------------------------------------------------------------

      Found                      : Boolean := False;
      Index                      : Natural := 0;

      ------------------------------------------------------------
      procedure Process (
         Cursor                  : in     Row_Array.Cursor) is
      ------------------------------------------------------------

      begin
         if not Found then
            Index := Index + 1;
            if Table_Type'class (Table).Is_Row (Row_Array.Element (Cursor).all, ID) then
               Found := True;
            end if;
         end if;
      end Process;
      ------------------------------------------------------------

   begin
      Table.Rows.Iterate (Process'access);

      if Found then
         Table.Delete_Row (Index);
      else
         raise Failed with "could not find ID '" & ID & "' in Delete_Row " & Here;
      end if;
   end Delete_Row;

   ---------------------------------------------------------------
   procedure Faital_Error (
      Table                      : in out Table_Type;
      Here                       : in     String;
      Who                        : in     String;
      Message                    : in     String) is
   ---------------------------------------------------------------

      Line                       : constant String := "Application encountered a fatal error at " &
                                    Here & " in " & Who & ". Message: " & Message;
   begin
      GNOGA.GUI.Window.Alert (Table.Main_Window.all, Line);
      Put_Line (Line);
      CAC.OS.Immediate_Halt (0);
   end Faital_Error;

   ---------------------------------------------------------------
   function Get_Number_Rows (
      Table                      : in     Table_Type
   ) return Natural is
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who);
      return Natural (Table.Rows.Length);
   end Get_Number_Rows;

   ---------------------------------------------------------------
   function Get_Row (
      Table                      : in out Table_Type;
      Index                      : in     Positive
   ) return Row_Class_Access is
   ---------------------------------------------------------------

   begin
      return Table.Rows.Element (Index);
   end Get_Row;

   ---------------------------------------------------------------
   function Get_Row (
      Table                      : in out Table_Type;
      Tag                        : in     String
   ) return Row_Class_Access is
   ---------------------------------------------------------------

      Row                        : Row_Class_Access := Null;

      ------------------------------------------------------------
      procedure Process (
         Cursor                  : in     Row_Array.Cursor) is
      ------------------------------------------------------------

      begin
         if Row = Null then
            Row := Row_Array.Element (Cursor);

            if not Table_Type'class (Table).Is_Row (Row.all, Tag) then
               Row := Null;   -- keep looking
            end if;
         end if;
      end Process;
      ------------------------------------------------------------

   begin
      Table.Rows.Iterate (Process'access);

      if Row = Null then
         raise Failed with "could not find Tag '" & Tag & "' in Get_Row " & Here;
      else
         return Row;
      end if;
   end Get_Row;

   ---------------------------------------------------------------
   function Is_Row (                   -- tests if ID identifies Row
      Table                      : in out Table_Type;
      Row                        : in     Row_Type'class;
      ID                         : in     String
   ) return Boolean is
   pragma Unreferenced (Row);
   ---------------------------------------------------------------

   begin
      Log (Debug, Here, Who & " ID: " & ID);
      Table.Faital_Error (Here, Who," should never be called");
      return False;
   end Is_Row;

   ---------------------------------------------------------------
   procedure Set_Main_Window (
      Table                      : in out Table_Type;
      Main_Window                : access Gnoga.Gui.Window.Window_Type'Class) is
   ---------------------------------------------------------------

   begin
      Table.Main_Window := Main_Window;
   end Set_Main_Window;

   ---------------------------------------------------------------
   procedure Table_Resize_Handler (
      Object                     : in out Gnoga.Gui.Base.Base_Type'Class) is
   pragma Unreferenced (Object);
   ---------------------------------------------------------------

      Connection_Data            : constant Connection_Data_Class_Access :=
                                    Connection_Data_Class_Access (Framework.Get_Connection (
                                       Connection_ID));
   begin
      Log (Debug, Here, Who);
      Connection_Data.Table.Adjust_Table_Height;
   end Table_Resize_Handler;

-- ---------------------------------------------------------------
-- package body Table_Package is
--
-- end Table_Package;

--    ---------------------------------------------------------------
-- procedure Set_Free_On_Delete (
--    Row                    : in out Abstract_Element_Type;
--    Free_On_Delete             : in     Boolean) is
--    ---------------------------------------------------------------
--
-- begin
--    Row.Free_On_Delete := Free_On_Delete;
-- end Set_Free_On_Delete;

end Widget.Table;
