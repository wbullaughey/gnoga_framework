with CAC.Trace; use CAC.Trace;

package body Table is

   procedure Create_Column (
      View                       : in out View_Type;
      Row                        : in out Gnoga.Gui.Element.Table.Table_Row_Type;
      Column                     : in out Gnoga.Gui.Element.Table.Table_Column_Type);

   ----------------------------------------------------------------------------
   overriding
   procedure Create (
      View                       : in out View_Type;
      Parent                     : in out Gnoga.Gui.Base.Base_Type'Class;
      ID                         : in     String  := "") is
   ----------------------------------------------------------------------------

   begin
log (here, who);
      Log (Debug, Here, Who & " enter");
      Gnoga.Gui.View.Docker.Docker_View_Type (View).Create (Parent, "table_dock");
      View.Border;

      View.Form.Create (View);
      View.Table.Create (View.Form, "table");
      View.New_Entry_Row.Create (View.Table, "new_entry");
      Create_Column (View, View.New_Entry_Row, View.Name_Column);
      View.Name.Create (View.Form,
         Columns  => 20,
         ID       => (if ID = "" then "name" else ID),
         Name     => "name",
         Rows     => 1,
         Value    => "");
      View.Name.Place_Inside_Top_Of (View.Name_Column);
      Log (Debug, Here, Who & " EXIT");
   end Create;

   ----------------------------------------------------------------------------
   procedure Create_Column (
      View                       : in out View_Type;
      Row                        : in out Gnoga.Gui.Element.Table.Table_Row_Type;
      Column                     : in out Gnoga.Gui.Element.Table.Table_Column_Type) is
   ----------------------------------------------------------------------------

   begin
      Column.Create (Row);
   end Create_Column;

end Table;
