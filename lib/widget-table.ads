with Ada.Containers.Vectors;
with Framework;
--with Framework.Dock_Base;
--with Gnoga.Gui.Base;
--with Gnoga.Gui.Element.Common;
with Gnoga.Gui.Element.Form;
with Gnoga.Gui.Element.Table;
with Gnoga.Gui.View;
--with Gnoga.Gui.View.Docker;
with Gnoga.Gui.Window;

package Widget.Table is

   type Connection_Data_Type     is new Framework.Connection_Data_Type with private;
   type Connection_Data_Class_Access
                                 is access all Connection_Data_Type'class;
   type Table_Type               is new Gnoga.Gui.View.View_Type with private;
   type Table_Class_Access       is access all Table_Type'class;
   subtype Row_Header_Type       is Gnoga.Gui.Element.Table.Table_Row_Type;
-- type Row_Header_Class_Access  is access all Row_Header_Type'class;
   subtype Row_Type              is Gnoga.Gui.Element.Table.Table_Row_Type;
   type Row_Class_Access         is access all Row_Type'class;

   procedure Add_Row (
      Table                      : in out Table_Type;
      Row                        : in     Row_Class_Access);

   procedure Adjust_Table_Height (
      Table                      : in out Table_Type);

   procedure Connection_Handler (             -- handle new connection from browser
      Connection_Data            : in out Connection_Data_Type;
      Main_Window                : in out Gnoga.Gui.Window.Window_Type'Class);

   procedure Create (
      Table                      : in out Table_Type;
      Main_Window                : access Gnoga.Gui.Window.Window_Type'Class;
      Parent                     : in out Gnoga.Gui.View.View_Type'Class;
      Form                       : in out Gnoga.Gui.Element.Form.Form_Type'class;
      ID_Prefix                  : in     String;
      Header                     : access Row_Header_Type'class);

   procedure Delete_Row (
      Table                      : in out Table_Type;
      Index                      : in     Positive);

   procedure Delete_Row (
      Table                      : in out Table_Type;
      ID                         : in     String);

   procedure Faital_Error (
      Table                      : in out Table_Type;
      Here                       : in     String;
      Who                        : in     String;
      Message                    : in     String);

   function Get_Number_Rows (
      Table                      : in     Table_Type
   ) return Natural;

   function Get_Row (
      Table                      : in out Table_Type;
      Index                      : in     Positive
   ) return Row_Class_Access;

   function Get_Row (
      Table                      : in out Table_Type;
      Tag                        : in     String
   ) return Row_Class_Access;

   function Is_Row (                   -- tests if ID identifies Row
      Table                      : in out Table_Type;
      Row                        : in     Row_Type'class;
      ID                         : in     String
   ) return Boolean;

   procedure Set_Main_Window (
      Table                      : in out Table_Type;
      Main_Window                : access Gnoga.Gui.Window.Window_Type'Class);

--   generic
--      type Table_Parameter_Type (<>)
--                                 is new Table_Type with private;
--      ID_Prefix                  : in String;
--
--   package Table_Package is
--      type Table_Type            is new Table_Parameter_Type with private;
--
--      overriding
--      procedure Add_Row (
--         Table                      : in out Table_Type;
--         Row                        : in     Row_Class_Access);
--
--      overriding
--      procedure Adjust_Table_Height (
--         Table                      : in out Table_Type);
--
--      function Count (
--         Table                      : in     Table_Type
--      ) return Natural;
--
--      overriding
--      procedure Create (
--         Table                      : in out Table_Type;
--         Main_Window                : access Gnoga.Gui.Window.Window_Type'Class;
--         Parent                     : in out Gnoga.Gui.View.Docker.Docker_View_Type'Class;
--         Form                       : in out Gnoga.Gui.Element.Form.Form_Type'class;
--         Header                     : access Row_Header_Type'class);
--
--      overriding
--      procedure Delete_Row (
--         Table                      : in out Table_Type;
--         Index                      : in     Positive);
--
--      overriding
--      procedure Delete_Row (
--         Table                      : in out Table_Type;
--         Tag                        : in     String);
--
----    overriding
--      function Get_Row (
--         Table                      : in out Table_Type;
--         Index                      : in     Positive
--      ) return Row_Class_Access;
--
----    overriding
--      function Get_Row (
--         Table                      : in out Table_Type;
--         Tag                        : in     String
--      ) return Row_Class_Access;
--
--      overriding
--      function Number_Rows (
--         Table                      : in out Table_Type
--      ) return Natural;

private

   function Compare_Rows (
      Left, Right                : in     Row_Class_Access
   ) return Boolean;

   type Connection_Data_Type     is new Framework.Connection_Data_Type with record
      Table                      : Table_Class_Access := Null;
   end record;

   package Row_Array             is new Ada.Containers.Vectors (
      Positive, Row_Class_Access, Compare_Rows);

   type Table_Type               is new Gnoga.Gui.View.View_Type with record
      Connection_Data            : aliased Connection_Data_Type;
      Form                       : access Gnoga.Gui.Element.Form.Form_Type'class := Null;
      Main_Window                : access Gnoga.Gui.Window.Window_Type'Class := Null;
      Rows                       : Row_Array.Vector;
      Table                      : Gnoga.Gui.Element.Table.Table_Type;
      Table_Body                 : Gnoga.Gui.Element.Table.Table_Body_Type;
      Table_Header               : Gnoga.Gui.Element.Table.Table_Header_Type;
      Table_Header_Row           : access Row_Header_Type'class;
      Table_Offset               : Natural := 0;
   end record;

end Widget.Table;
