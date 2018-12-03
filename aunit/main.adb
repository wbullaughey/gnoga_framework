with Ada.Command_Line;
--with Ada_Lib_AUnit_Lib;
with Ada.Text_IO;use Ada.Text_IO;
--with Aunit.Assertions; use Aunit.Assertions;
with AUnit.Options;
with AUnit.Reporter.Text;
with AUnit.Run;
with CAC.Interrupt;
with CAC.Interrupt_Names;
with CAC.Unit_Test.Expression_Filter;
with CAC.OS;
with CAC.Trace.Tasks; use CAC.Trace;
with Command_Line_Iterator;
with Docker_Suite;
with Docker_Tests;
with Framework.Dock;
with Framework.Table;
with GNOGA;
with Main_Suite;
with Main_Tests;
with Options;
--with Table;
--with Top_Window;
--with Top_Window_Suite;
--with Top_Window_Tests;

procedure Main is

   package Interrupt_Handler is

      type Handler_Type          is new CAC.Interrupt.Handler_Type with null record;

      overriding
      procedure Signal (
         Interrupt            : in   CAC.Interrupt_Names.Interrupt_Type;
         Handler              : in out Handler_Type);

   end Interrupt_Handler;

   ---------------------------------------------------------------
   package body Interrupt_Handler is

      ------------------------------------------------------------
      procedure Signal (
         Interrupt            : in   CAC.Interrupt_Names.Interrupt_Type;
         Handler              : in out Handler_Type) is
      pragma Unreferenced (Interrupt, Handler);
      ------------------------------------------------------------

      begin
         CAC.Trace.Tasks.Report;
      end Signal;

   end Interrupt_Handler;

   procedure Docker_Suite_Runner is new AUnit.Run.Test_Runner (Docker_Suite.Suite);
   procedure Main_Suite_Runner is new AUnit.Run.Test_Runner (Main_Suite.Suite);
-- procedure Top_Window_Suite_Runner is new AUnit.Run.Test_Runner (Top_Window_Suite.Suite);

   ----------------------------------------------------------------------------
   procedure Help is
   ----------------------------------------------------------------------------

   begin
      Put_Line (Ada.Command_Line.Command_Name);
      Put_Line ("   -e <expression>    filter expression");
      Put_Line ("   -h                 this message");
--    Put_Line ("   -i                 interactive mode");
      Put_Line ("   -m                 manual test");
      Put_Line ("   -p                 enable debug pause");
      Put_Line ("   -s <test suite>    select test suite to run");
      Put_Line ("   -S <test suite>    inhibit test suite to run");
      Put_Line ("   -t <trace option>  select trace to turn on");
      Put_Line ("   -T <trace output option>  select trace option to change default");
      Put_Line ("trace options:");
      Put_Line ("   -a                 all");
      Put_Line ("   -d                 dock");
      Put_Line ("   -f                 framework");
      Put_Line ("   -g                 gnoga");
      Put_Line ("   -t                 table");
      Put_Line ("   -w                 top window");
      New_Line;
      Put_Line ("  <test suite>");
      Put_Line ("   c                  CAC.Trace");
      Put_Line ("   d                  docker");
      Put_Line ("   m                  main");
      Put_Line ("   t                  top window");

      CAC.OS.Immediate_Halt (0);
   end Help;

   Break_Handler                 : aliased Interrupt_Handler.Handler_Type;
   Do_Docker_Suite               : boolean := True;
   Do_Main_Suite                 : boolean := True;
   Do_Top_Window_Suite           : boolean := True;
   Filter                        : aliased CAC.Unit_Test.Expression_Filter.Filter_Type;
   Iterator                      : Command_Line_Iterator.Iterator_Type :=
                                    Command_Line_Iterator.Initialize (
                                       Include_Options         => True,
                                       Include_Non_Options     => True,
                                       Options_With_Parameters => "esPStT");

   Options  : AUnit.Options.AUnit_Options;
   Reporter : AUnit.Reporter.Text.Text_Reporter;

begin
   CAC.Interrupt.Attach_Handler (CAC.Interrupt_Names.SIGTERM,
      Break_Handler'unchecked_access);

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

------                when 'i' =>
------                   Top_Window_Tests.Interactive := True;

                  when 'm' =>
                     Standard.Options.Manual := True;

                  when 'p' =>
                     Standard.Options.Pause := True;

                  when 'P' =>
                     Standard.Options.Port := Iterator.Get_Number;

                  when 's' =>    -- suites to include
                     Do_Docker_Suite := False;
                     Do_Main_Suite := False;
                     Do_Top_Window_Suite := False;

                     declare
                        Options     : constant String := Iterator.Get_Parameter;
                        Suite       : constant Character := Options (Options'first);

                     begin
                        case Suite is

                           when 'd' =>
                              Do_Docker_Suite := True;

                           when 'm' =>
                              Do_Main_Suite := True;

                           when 't' =>
                              Do_Top_Window_Suite := True;

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

                           when 'd' =>
                              Do_Docker_Suite := False;

                           when 'm' =>
                              Do_Main_Suite := False;

                           when 't' =>
                              Do_Top_Window_Suite := False;

                           when others =>
                              Put_Line ("unexpected suite option '" & Suite & "'");
                              Help;

                        end case;
                     end;

                  when 't' =>
                     declare
                        Parameter   : constant String := Iterator.Get_Parameter;

                     begin
                        for Index in Parameter'range  loop
                           declare
                              Trace    : constant Character := Parameter (Index);

                           begin
                              case Trace is

                                 when 'a' =>
                                    CAC.Trace.CAC_Lib_Debug := True;
                                    Framework.Dock.Debug := True;
                                    Docker_Tests.Debug := True;
                                    Framework.Debug := True;
                                    GNOGA.Debug := True;
                                    Main_Tests.Debug := True;
                                    Framework.Table.Debug := True;

                                 when 'c' =>
                                    CAC.Trace.CAC_Lib_Debug := True;

                                 when 'd' =>
                                    Framework.Dock.Debug := True;
                                    Docker_Tests.Debug := True;

                                 when 'f' =>
                                    Framework.Debug := True;

                                 when 'g' =>
                                    GNOGA.Debug := True;

                                 when 'm' =>
                                    Main_Tests.Debug := True;

                                 when 't' =>
                                    Framework.Table.Debug := True;

--                               when 'w' =>
--                                  Top_Window.Debug := True;

                                 when Others =>
                                    Put_Line ("invalid option '" & Option & "'");
                                    CAC.OS.Immediate_Halt (-1);

                              end case;
                           end;
                        end loop;
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

      if Do_Docker_Suite then
         Log (Framework.Debug, Here, Who & " start docker suite");
         Docker_Suite_Runner (Reporter, Options);
         Log (Framework.Debug, Here, Who & " end docker suite");
      end if;

      if Do_Main_Suite then
         Log (Framework.Debug, Here, Who & " start main suite");
         Main_Suite_Runner (Reporter, Options);
         Log (Framework.Debug, Here, Who & " end main suite");
      end if;

      if Do_Top_Window_Suite then
         Log (Framework.Debug, Here, Who & " start Top_Window suite");
--       Top_Window_Suite_Runner (Reporter, Options);
         Log (Framework.Debug, Here, Who & " end Top_Window suite");
      end if;

   exception
      when Fault: others =>
         Trace_Exception (Fault, Here, Who);

   end;
   Put_Line ("all tests completed");
   CAC.Interrupt.Cleanup;
   CAC.Trace.Tasks.Report;
   log (Framework.Debug, here, Who);

exception
   when Fault: others =>
      Trace_Exception (Fault, Here, Who);

end Main;


