with Ada.Text_IO; use Ada.Text_IO;
with CAC.OS;
with CAC.Trace; use CAC.Trace;
with Command_Line_Iterator;
--with Framework;
--with Gnoga.Application.Multi_Connect;
--with Gnoga.Gui.Window;
with Top_Window;
with Types;

procedure Main is

-- package Application is new Framework.Skeleton (Types.Connection_Type,
--    Widget.Connection_Handler'access, "Framework Test");


   procedure Usage;

   ---------------------------------------------------------------
   procedure Command_Line is
   ---------------------------------------------------------------

   begin
      declare
         Iterator                   : Command_Line_Iterator.Iterator_Type :=
                                       Command_Line_Iterator.Initialize (
                                          Include_Options         => True,
                                          Include_Non_Options     => False,
                                          Options_With_Parameters => "fFhptw");
      begin
         while not Iterator.At_End loop
            declare
               Option               : constant Character := Iterator.Get_Option;

            begin
               case Option  is

                  when '?' =>
                     Usage;

                  when 't' =>
                     declare
                        Options     : constant String := Iterator.Get_Parameter;

                     begin
                        for Index in Options'range loop
                           declare
                              Option   : Character renames Options (index);

                           begin
                              case Option is

                                 when 'm' =>
                                    Top_Window.Debug := True;

                                 when others =>
                                    Ada.Text_IO.Put_Line ("invalid trace option '" &
                                       Option & "'");
                                    Usage;

                              end case;
                           end;
                        end loop;
                     end;

                  when others =>
                     Put_Line ("invalid command line flag '" & Option & "'");
                     Usage;

               end case;
            end;
            Iterator.Advance;
         end loop;
      end;

   exception

      when Fault: others =>
         Trace_Exception (Fault, Here);
         Usage;

   end Command_Line;

   ---------------------------------------------------------------
   procedure Usage is
   ---------------------------------------------------------------

   begin
      Put_Line ("db_view <options>");
      New_Line;
      Put_Line ("   <options>:");
      Put_Line ("      -?                    this message");
      Put_Line ("      -t <trace options>    set trace");
      New_Line;
      Put_Line ("  <trace options>:");
      CAC.OS.Immediate_Halt (-1);
   end Usage;
   ---------------------------------------------------------------


begin
   Command_Line;
   Top_Window.Create;
   Top_Window.Run;
end Main;
