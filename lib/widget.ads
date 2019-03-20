with Ada.Strings.Unbounded;

package widget is

   Failed                        : exception;

   subtype Unbounded_String      is Ada.Strings.Unbounded.Unbounded_String;

   function Coerce (
      Source                     : in     String
   ) return Unbounded_String renames Ada.Strings.Unbounded.To_Unbounded_String;

   function Coerce (
      Source                     : in     Unbounded_String
   ) return String renames Ada.Strings.Unbounded.To_String;

   Debug                         : Boolean := False;

end Widget;
