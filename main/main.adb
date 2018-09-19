with Command_Line_Iterator;
with Framework;

procedure Main is

   package Application is new Framework;

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
      DB_View.Options.Help;
      CAC.OS.Immediate_Halt (-1);
   end Usage;
   ---------------------------------------------------------------
begin
   Command_Line;
   Application.Run;
end Main;
