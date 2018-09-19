with Ada.Command_Line;
--with Ada_Lib_AUnit_Lib;
with Ada.Text_IO;use Ada.Text_IO;
with AUnit.Options;
with AUnit.Reporter.Text;
with AUnit.Run;
with CAC.Unit_Test.Expression_Filter;
with CAC.OS;
with CAC.Trace; use CAC.Trace;
with Command_Line_Iterator;
with Framework;
with Main_Suite;

procedure Main is

   procedure Main_Suite_Runner is new AUnit.Run.Test_Runner (Main_Suite.Suite);

   ----------------------------------------------------------------------------
   procedure Help is
   ----------------------------------------------------------------------------

   begin
      Put_Line (Ada.Command_Line.Command_Name);
      Put_Line ("   -e <expression>    filter expression");
      Put_Line ("   -h                 this message");
      Put_Line ("   -p                 enable debug pause");
      Put_Line ("   -s <test suite>    select test suite to run");
      Put_Line ("   -S <test suite>    inhibit test suite to run");
      Put_Line ("   -t <trace option>  select trace to turn on");
      Put_Line ("   -T <trace output option>  select trace option to change default");
      Put_Line ("trace options:");
      CAC.OS.Immediate_Halt (0);
   end Help;

   Do_Main_Suite                 : boolean := True;
   Filter                        : aliased CAC.Unit_Test.Expression_Filter.Filter_Type;
   Iterator                      : Command_Line_Iterator.Iterator_Type :=
                                    Command_Line_Iterator.Initialize (
                                       Include_Options         => True,
                                       Include_Non_Options     => True,
                                       Options_With_Parameters => "esStT");

   Options  : AUnit.Options.AUnit_Options;
   Reporter : AUnit.Reporter.Text.Text_Reporter;

begin
   begin
      Options.Filter := Filter'unchecked_access;

      while not Iterator.At_End loop
         if Iterator.Is_Option then
            declare
               Option               : constant Character := Iterator.Get_Option;

            begin
               case Option is

                  when 'e' =>
                     declare
                        Parameter   : constant String := Iterator.Get_Parameter;

                     begin
                        Filter.Set_Expression (Parameter);
                     end;

                  when 'h' =>
                     Help;

                  when 's' =>    -- suites to include
                     Do_Main_Suite := False;

                     declare
                        Options     : constant String := Iterator.Get_Parameter;
                        Suite       : constant Character := Options (Options'first);

                     begin
                        case Suite is

                           when 'm' =>
                              Do_Main_Suite := True;

--                            if Options'length > 1 then
--                               Main_Suite.Do_Dictionary_Tests := False;
--                            end if;
--
--                            for Index in Options'first + 1 .. OPtions'last  loop
--                               declare
--                                  Option : constant Character := Options (Index);
--
--                               begin
--                                  case Option is
--
--                                     when others =>
--                                        Put_Line ("unexpected data suite option '" & Option & "'");
--                                        Help;
--
--                                  end case;
--                               end;
--                            end loop;

                           when others =>
                              Put_Line ("unexpected suite option '" & Suite & "'");
                              Help;

                        end case;
                     end;

                  when 'S' =>    -- suites to exclude
                     declare
                        Options     : constant String := Iterator.Get_Parameter;
                        Suite       : constant Character := Options (Options'first);

                     begin
                        case Suite is

                           when 'm' =>
                              Do_Main_Suite := False;

                           when others =>
                              Put_Line ("unexpected suite option '" & Suite & "'");
                              Help;

                        end case;
                     end;

--                when 'T' =>
--                   declare
--                      Parameter   : constant String := Iterator.Get_Parameter;
--
--                   begin
--                      for Index in Parameter'range  loop
--                         declare
--                            Trace    : constant Character := Parameter (Index);
--
--                         begin
--                            case Trace is
--
--                               when 'p' =>
--                                  Cac.trace.include_Task := not Cac.trace.include_Task;
--
--                               when 't' =>
--                                  Cac.trace.include_Time := not Cac.trace.include_Time;
--
--                               when others =>
--                                  Put_Line ("unexpected trace option '" & Trace & "'");
--                                  Help;
--
--                            end case;
--                         end;
--                      end loop;
--                   end;

                  when 'v' =>
                     Framework.Verbose := True;
                     CAC.Trace.CAC_Lib_Verbose := True;

                  when Others =>
                     Put_Line ("invalid option '" & Option & "'");
                     CAC.OS.Immediate_Halt (-1);

               end case;
            end;
         else
            declare
               Argument             : constant String := Iterator.Get_Argument;

            begin
               Put_Line ("set name '" & Argument & "'");
               Filter.Set_Name (Argument);
            end;
         end if;

         if not Iterator.At_End then
            Iterator.Advance;
         end if;

      end loop;

      if Do_Main_Suite then
         Log (Framework.Debug, Here, Who & " start main suite");
         Main_Suite_Runner (Reporter, Options);
         Log (Framework.Debug, Here, Who & " end main suite");
      end if;


   exception
      when Fault: others =>
         Trace_Exception (Fault, Here, Who);

   end;
-- DB_View.GNOGA_Lib.Terminate_GNOGA;
   Put_Line ("all tests completed");
   delay 0.1;     -- let any tasks ready to stop finish
-- Tasks.Report;
--   Assert (Tasks.All_Stopped, "not all tasks stopped");
   log (Framework.Debug, here, Who);

exception
   when Fault: others =>
      Trace_Exception (Fault, Here, Who);

end Main;


