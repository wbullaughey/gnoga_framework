with Gnoga.Gui.Base;
with Gnoga.Gui.Element.Form;
with Gnoga.Gui.Element.Table;
with Gnoga.Gui.View.Docker;

package Table is

   type View_Type             is new Gnoga.Gui.View.Docker.Docker_View_Type with private;

   overriding
   procedure Create (
      View                       : in out View_Type;
      Parent                     : in out Gnoga.Gui.Base.Base_Type'Class;
      ID                         : in     String  := "");

   Debug                         : Boolean := False;

private

   type View_Type             is new Gnoga.Gui.View.Docker.Docker_View_Type with record
      Counts_Column           : Gnoga.Gui.Element.Table.Table_Column_Type;
      Delete_Column           : Gnoga.Gui.Element.Table.Table_Column_Type;
      Form                    : Gnoga.Gui.Element.Form.Form_Type;
      Name                    : Gnoga.Gui.Element.Form.Text_Area_Type;
      Name_Column             : Gnoga.Gui.Element.Table.Table_Column_Type;
      New_Entry_Row           : Gnoga.Gui.Element.Table.Table_Row_Type;
      On_Change_Column        : Gnoga.Gui.Element.Table.Table_Column_Type;
      Subscribe_Column        : Gnoga.Gui.Element.Table.Table_Column_Type;
      Table                   : Gnoga.Gui.Element.Table.Table_Type;
      Timestamp_Column        : Gnoga.Gui.Element.Table.Table_Column_Type;
   end record;

end Table;
