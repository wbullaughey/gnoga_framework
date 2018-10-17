with Framework.Docker_View;
with Gnoga.Gui.Base;
with Gnoga.Gui.Element.Common;

package Top_Window is

   type View_Type                is new Framework.Docker_View.View_Type with record
      Exit_Button                : Gnoga.Gui.Element.Common.Button_Type;
      Trace_Button               : Gnoga.Gui.Element.Common.Button_Type;
   end record;

--    type View_Class_Access        is access all View_Type'class;

   type Connection_Data_Type     is new Framework.Connection_Type with record
      Exited                     : Boolean := False;
      View                       :  aliased View_Type;
   end record;

   procedure Create (
      Connection                 : in out Connection_Data_Type);
--
-- procedure Run;

   Debug                         : Boolean := False;

private

   overriding
   procedure Create (
      View                       : in out View_Type;
      Parent                     : in out Gnoga.Gui.Base.Base_Type'Class;
      ID                         : in     String  := "");

end Top_Window;
