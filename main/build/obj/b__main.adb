pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;
with Ada.Exceptions;

package body ada_main is

   E011 : Short_Integer; pragma Import (Ada, E011, "system__soft_links_E");
   E021 : Short_Integer; pragma Import (Ada, E021, "system__exception_table_E");
   E023 : Short_Integer; pragma Import (Ada, E023, "system__exceptions_E");
   E015 : Short_Integer; pragma Import (Ada, E015, "system__secondary_stack_E");
   E248 : Short_Integer; pragma Import (Ada, E248, "ada__containers_E");
   E066 : Short_Integer; pragma Import (Ada, E066, "ada__io_exceptions_E");
   E362 : Short_Integer; pragma Import (Ada, E362, "ada__numerics_E");
   E179 : Short_Integer; pragma Import (Ada, E179, "ada__strings_E");
   E285 : Short_Integer; pragma Import (Ada, E285, "ada__strings__utf_encoding_E");
   E084 : Short_Integer; pragma Import (Ada, E084, "interfaces__c_E");
   E323 : Short_Integer; pragma Import (Ada, E323, "interfaces__c__strings_E");
   E076 : Short_Integer; pragma Import (Ada, E076, "system__os_lib_E");
   E050 : Short_Integer; pragma Import (Ada, E050, "ada__tags_E");
   E065 : Short_Integer; pragma Import (Ada, E065, "ada__streams_E");
   E079 : Short_Integer; pragma Import (Ada, E079, "system__file_control_block_E");
   E074 : Short_Integer; pragma Import (Ada, E074, "system__finalization_root_E");
   E072 : Short_Integer; pragma Import (Ada, E072, "ada__finalization_E");
   E071 : Short_Integer; pragma Import (Ada, E071, "system__file_io_E");
   E219 : Short_Integer; pragma Import (Ada, E219, "ada__streams__stream_io_E");
   E201 : Short_Integer; pragma Import (Ada, E201, "system__storage_pools_E");
   E197 : Short_Integer; pragma Import (Ada, E197, "system__finalization_masters_E");
   E195 : Short_Integer; pragma Import (Ada, E195, "system__storage_pools__subpools_E");
   E178 : Short_Integer; pragma Import (Ada, E178, "ada__calendar_E");
   E247 : Short_Integer; pragma Import (Ada, E247, "ada__calendar__delays_E");
   E277 : Short_Integer; pragma Import (Ada, E277, "ada__calendar__time_zones_E");
   E271 : Short_Integer; pragma Import (Ada, E271, "ada__real_time_E");
   E063 : Short_Integer; pragma Import (Ada, E063, "ada__text_io_E");
   E349 : Short_Integer; pragma Import (Ada, E349, "gnat__secure_hashes_E");
   E351 : Short_Integer; pragma Import (Ada, E351, "gnat__secure_hashes__sha1_E");
   E347 : Short_Integer; pragma Import (Ada, E347, "gnat__sha1_E");
   E215 : Short_Integer; pragma Import (Ada, E215, "system__assertions_E");
   E185 : Short_Integer; pragma Import (Ada, E185, "ada__strings__maps_E");
   E213 : Short_Integer; pragma Import (Ada, E213, "ada__strings__maps__constants_E");
   E181 : Short_Integer; pragma Import (Ada, E181, "ada__strings__unbounded_E");
   E259 : Short_Integer; pragma Import (Ada, E259, "system__pool_global_E");
   E325 : Short_Integer; pragma Import (Ada, E325, "system__pool_size_E");
   E313 : Short_Integer; pragma Import (Ada, E313, "gnat__sockets_E");
   E321 : Short_Integer; pragma Import (Ada, E321, "gnat__sockets__thin_common_E");
   E316 : Short_Integer; pragma Import (Ada, E316, "gnat__sockets__thin_E");
   E309 : Short_Integer; pragma Import (Ada, E309, "system__regexp_E");
   E304 : Short_Integer; pragma Import (Ada, E304, "ada__directories_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "system__tasking__initialization_E");
   E156 : Short_Integer; pragma Import (Ada, E156, "system__tasking__protected_objects_E");
   E160 : Short_Integer; pragma Import (Ada, E160, "system__tasking__protected_objects__entries_E");
   E154 : Short_Integer; pragma Import (Ada, E154, "system__tasking__queuing_E");
   E269 : Short_Integer; pragma Import (Ada, E269, "system__tasking__stages_E");
   E410 : Short_Integer; pragma Import (Ada, E410, "system__interrupt_management__operations_E");
   E408 : Short_Integer; pragma Import (Ada, E408, "system__tasking__async_delays_E");
   E082 : Short_Integer; pragma Import (Ada, E082, "cac__os_E");
   E225 : Short_Integer; pragma Import (Ada, E225, "command_line_iterator_E");
   E329 : Short_Integer; pragma Import (Ada, E329, "generic_unbounded_array_E");
   E387 : Short_Integer; pragma Import (Ada, E387, "generic_unbounded_ptr_array_E");
   E273 : Short_Integer; pragma Import (Ada, E273, "gnoga_E");
   E302 : Short_Integer; pragma Import (Ada, E302, "gnoga__server_E");
   E394 : Short_Integer; pragma Import (Ada, E394, "gnoga__server__mime_E");
   E294 : Short_Integer; pragma Import (Ada, E294, "gnoga__types_E");
   E398 : Short_Integer; pragma Import (Ada, E398, "gnoga__server__database_E");
   E400 : Short_Integer; pragma Import (Ada, E400, "gnoga__server__model_E");
   E402 : Short_Integer; pragma Import (Ada, E402, "gnoga__server__model__queries_E");
   E396 : Short_Integer; pragma Import (Ada, E396, "gnoga__server__template_parser_E");
   E404 : Short_Integer; pragma Import (Ada, E404, "gnoga__server__template_parser__simple_E");
   E420 : Short_Integer; pragma Import (Ada, E420, "gnoga__types__colors_E");
   E339 : Short_Integer; pragma Import (Ada, E339, "object_E");
   E341 : Short_Integer; pragma Import (Ada, E341, "object__handle_E");
   E343 : Short_Integer; pragma Import (Ada, E343, "object__handle__generic_unbounded_array_E");
   E385 : Short_Integer; pragma Import (Ada, E385, "stack_storage_E");
   E210 : Short_Integer; pragma Import (Ada, E210, "strings_E");
   E090 : Short_Integer; pragma Import (Ada, E090, "cac__trace_E");
   E255 : Short_Integer; pragma Import (Ada, E255, "cac__trace__tasks_E");
   E289 : Short_Integer; pragma Import (Ada, E289, "gnoga__application_E");
   E333 : Short_Integer; pragma Import (Ada, E333, "strings_edit_E");
   E359 : Short_Integer; pragma Import (Ada, E359, "strings_edit__base64_E");
   E373 : Short_Integer; pragma Import (Ada, E373, "strings_edit__fields_E");
   E337 : Short_Integer; pragma Import (Ada, E337, "strings_edit__integer_edit_E");
   E331 : Short_Integer; pragma Import (Ada, E331, "gnat__sockets__server_E");
   E327 : Short_Integer; pragma Import (Ada, E327, "gnat__sockets__connection_state_machine_E");
   E357 : Short_Integer; pragma Import (Ada, E357, "gnat__sockets__connection_state_machine__big_endian__unsigneds_E");
   E381 : Short_Integer; pragma Import (Ada, E381, "gnat__sockets__connection_state_machine__expected_sequence_E");
   E383 : Short_Integer; pragma Import (Ada, E383, "gnat__sockets__connection_state_machine__terminated_strings_E");
   E369 : Short_Integer; pragma Import (Ada, E369, "strings_edit__float_edit_E");
   E361 : Short_Integer; pragma Import (Ada, E361, "strings_edit__floats_E");
   E360 : Short_Integer; pragma Import (Ada, E360, "strings_edit__floats_E");
   E371 : Short_Integer; pragma Import (Ada, E371, "strings_edit__quoted_E");
   E406 : Short_Integer; pragma Import (Ada, E406, "strings_edit__utf8__handling_E");
   E389 : Short_Integer; pragma Import (Ada, E389, "tables_E");
   E391 : Short_Integer; pragma Import (Ada, E391, "tables__names_E");
   E345 : Short_Integer; pragma Import (Ada, E345, "gnat__sockets__connection_state_machine__http_server_E");
   E412 : Short_Integer; pragma Import (Ada, E412, "gnoga__gui__base_E");
   E311 : Short_Integer; pragma Import (Ada, E311, "gnoga__server__connection_E");
   E392 : Short_Integer; pragma Import (Ada, E392, "gnoga__server__connection__common_E");
   E300 : Short_Integer; pragma Import (Ada, E300, "gnoga__client__storage_E");
   E416 : Short_Integer; pragma Import (Ada, E416, "gnoga__gui__element_E");
   E424 : Short_Integer; pragma Import (Ada, E424, "gnoga__gui__document_E");
   E438 : Short_Integer; pragma Import (Ada, E438, "gnoga__gui__element__style_block_E");
   E432 : Short_Integer; pragma Import (Ada, E432, "gnoga__gui__location_E");
   E422 : Short_Integer; pragma Import (Ada, E422, "gnoga__gui__view_E");
   E426 : Short_Integer; pragma Import (Ada, E426, "gnoga__gui__element__common_E");
   E436 : Short_Integer; pragma Import (Ada, E436, "gnoga__gui__view__card_E");
   E440 : Short_Integer; pragma Import (Ada, E440, "gnoga__gui__view__docker_E");
   E297 : Short_Integer; pragma Import (Ada, E297, "gnoga__gui__window_E");
   E291 : Short_Integer; pragma Import (Ada, E291, "gnoga__application__multi_connect_E");
   E245 : Short_Integer; pragma Import (Ada, E245, "framework_E");
   E434 : Short_Integer; pragma Import (Ada, E434, "framework__docker_view_E");
   E243 : Short_Integer; pragma Import (Ada, E243, "top_window_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      declare
         procedure F1;
         pragma Import (Ada, F1, "top_window__finalize_body");
      begin
         E243 := E243 - 1;
         F1;
      end;
      E434 := E434 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "framework__docker_view__finalize_spec");
      begin
         F2;
      end;
      declare
         procedure F3;
         pragma Import (Ada, F3, "framework__finalize_body");
      begin
         E245 := E245 - 1;
         F3;
      end;
      declare
         procedure F4;
         pragma Import (Ada, F4, "framework__finalize_spec");
      begin
         F4;
      end;
      declare
         procedure F5;
         pragma Import (Ada, F5, "gnoga__application__multi_connect__finalize_body");
      begin
         E291 := E291 - 1;
         F5;
      end;
      E297 := E297 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "gnoga__gui__window__finalize_spec");
      begin
         F6;
      end;
      E440 := E440 - 1;
      declare
         procedure F7;
         pragma Import (Ada, F7, "gnoga__gui__view__docker__finalize_spec");
      begin
         F7;
      end;
      E436 := E436 - 1;
      declare
         procedure F8;
         pragma Import (Ada, F8, "gnoga__gui__view__card__finalize_spec");
      begin
         F8;
      end;
      E422 := E422 - 1;
      E426 := E426 - 1;
      declare
         procedure F9;
         pragma Import (Ada, F9, "gnoga__gui__element__common__finalize_spec");
      begin
         F9;
      end;
      declare
         procedure F10;
         pragma Import (Ada, F10, "gnoga__gui__view__finalize_spec");
      begin
         F10;
      end;
      E432 := E432 - 1;
      declare
         procedure F11;
         pragma Import (Ada, F11, "gnoga__gui__location__finalize_spec");
      begin
         F11;
      end;
      E438 := E438 - 1;
      declare
         procedure F12;
         pragma Import (Ada, F12, "gnoga__gui__element__style_block__finalize_spec");
      begin
         F12;
      end;
      E424 := E424 - 1;
      declare
         procedure F13;
         pragma Import (Ada, F13, "gnoga__gui__document__finalize_spec");
      begin
         F13;
      end;
      E416 := E416 - 1;
      declare
         procedure F14;
         pragma Import (Ada, F14, "gnoga__gui__element__finalize_spec");
      begin
         F14;
      end;
      E300 := E300 - 1;
      declare
         procedure F15;
         pragma Import (Ada, F15, "gnoga__client__storage__finalize_spec");
      begin
         F15;
      end;
      E412 := E412 - 1;
      declare
         procedure F16;
         pragma Import (Ada, F16, "gnoga__server__connection__finalize_body");
      begin
         E311 := E311 - 1;
         F16;
      end;
      declare
         procedure F17;
         pragma Import (Ada, F17, "gnoga__server__connection__common__finalize_spec");
      begin
         E392 := E392 - 1;
         F17;
      end;
      declare
         procedure F18;
         pragma Import (Ada, F18, "gnoga__gui__base__finalize_spec");
      begin
         F18;
      end;
      E345 := E345 - 1;
      declare
         procedure F19;
         pragma Import (Ada, F19, "gnat__sockets__connection_state_machine__http_server__finalize_spec");
      begin
         F19;
      end;
      E383 := E383 - 1;
      declare
         procedure F20;
         pragma Import (Ada, F20, "gnat__sockets__connection_state_machine__terminated_strings__finalize_spec");
      begin
         F20;
      end;
      E381 := E381 - 1;
      declare
         procedure F21;
         pragma Import (Ada, F21, "gnat__sockets__connection_state_machine__expected_sequence__finalize_spec");
      begin
         F21;
      end;
      E357 := E357 - 1;
      declare
         procedure F22;
         pragma Import (Ada, F22, "gnat__sockets__connection_state_machine__big_endian__unsigneds__finalize_spec");
      begin
         F22;
      end;
      declare
         procedure F23;
         pragma Import (Ada, F23, "gnat__sockets__connection_state_machine__finalize_body");
      begin
         E327 := E327 - 1;
         F23;
      end;
      declare
         procedure F24;
         pragma Import (Ada, F24, "gnat__sockets__connection_state_machine__finalize_spec");
      begin
         F24;
      end;
      E331 := E331 - 1;
      declare
         procedure F25;
         pragma Import (Ada, F25, "gnat__sockets__server__finalize_spec");
      begin
         F25;
      end;
      declare
         procedure F26;
         pragma Import (Ada, F26, "gnoga__application__finalize_body");
      begin
         E289 := E289 - 1;
         F26;
      end;
      declare
         procedure F27;
         pragma Import (Ada, F27, "cac__trace__tasks__finalize_body");
      begin
         E255 := E255 - 1;
         F27;
      end;
      E385 := E385 - 1;
      declare
         procedure F28;
         pragma Import (Ada, F28, "stack_storage__finalize_spec");
      begin
         F28;
      end;
      E339 := E339 - 1;
      declare
         procedure F29;
         pragma Import (Ada, F29, "object__finalize_spec");
      begin
         F29;
      end;
      declare
         procedure F30;
         pragma Import (Ada, F30, "gnoga__server__template_parser__finalize_body");
      begin
         E396 := E396 - 1;
         F30;
      end;
      declare
         procedure F31;
         pragma Import (Ada, F31, "gnoga__server__template_parser__finalize_spec");
      begin
         F31;
      end;
      E402 := E402 - 1;
      declare
         procedure F32;
         pragma Import (Ada, F32, "gnoga__server__model__queries__finalize_spec");
      begin
         F32;
      end;
      E400 := E400 - 1;
      declare
         procedure F33;
         pragma Import (Ada, F33, "gnoga__server__model__finalize_spec");
      begin
         F33;
      end;
      E398 := E398 - 1;
      declare
         procedure F34;
         pragma Import (Ada, F34, "gnoga__server__database__finalize_spec");
      begin
         F34;
      end;
      E294 := E294 - 1;
      declare
         procedure F35;
         pragma Import (Ada, F35, "gnoga__types__finalize_spec");
      begin
         F35;
      end;
      E225 := E225 - 1;
      declare
         procedure F36;
         pragma Import (Ada, F36, "command_line_iterator__finalize_spec");
      begin
         F36;
      end;
      E160 := E160 - 1;
      declare
         procedure F37;
         pragma Import (Ada, F37, "system__tasking__protected_objects__entries__finalize_spec");
      begin
         F37;
      end;
      E304 := E304 - 1;
      declare
         procedure F38;
         pragma Import (Ada, F38, "ada__directories__finalize_spec");
      begin
         F38;
      end;
      E309 := E309 - 1;
      declare
         procedure F39;
         pragma Import (Ada, F39, "system__regexp__finalize_spec");
      begin
         F39;
      end;
      declare
         procedure F40;
         pragma Import (Ada, F40, "gnat__sockets__finalize_body");
      begin
         E313 := E313 - 1;
         F40;
      end;
      declare
         procedure F41;
         pragma Import (Ada, F41, "gnat__sockets__finalize_spec");
      begin
         F41;
      end;
      E325 := E325 - 1;
      declare
         procedure F42;
         pragma Import (Ada, F42, "system__pool_size__finalize_spec");
      begin
         F42;
      end;
      E259 := E259 - 1;
      declare
         procedure F43;
         pragma Import (Ada, F43, "system__pool_global__finalize_spec");
      begin
         F43;
      end;
      E181 := E181 - 1;
      declare
         procedure F44;
         pragma Import (Ada, F44, "ada__strings__unbounded__finalize_spec");
      begin
         F44;
      end;
      E063 := E063 - 1;
      declare
         procedure F45;
         pragma Import (Ada, F45, "ada__text_io__finalize_spec");
      begin
         F45;
      end;
      E195 := E195 - 1;
      declare
         procedure F46;
         pragma Import (Ada, F46, "system__storage_pools__subpools__finalize_spec");
      begin
         F46;
      end;
      E197 := E197 - 1;
      declare
         procedure F47;
         pragma Import (Ada, F47, "system__finalization_masters__finalize_spec");
      begin
         F47;
      end;
      E219 := E219 - 1;
      declare
         procedure F48;
         pragma Import (Ada, F48, "ada__streams__stream_io__finalize_spec");
      begin
         F48;
      end;
      declare
         procedure F49;
         pragma Import (Ada, F49, "system__file_io__finalize_body");
      begin
         E071 := E071 - 1;
         F49;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      System.Restrictions.Run_Time_Restrictions :=
        (Set =>
          (False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, True, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False),
         Value => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (True, False, False, True, True, True, False, True, 
           False, False, True, True, True, True, False, False, 
           True, False, False, True, True, False, True, True, 
           False, True, True, True, True, False, True, False, 
           False, False, True, False, True, True, False, True, 
           True, True, True, False, True, False, True, True, 
           False, False, True, False, True, True, False, True, 
           False, False, True, False, True, True, True, False, 
           False, True, False, True, True, True, False, True, 
           True, False, True, True, True, True, False, True, 
           True, False, False, False, True, True, True, True, 
           True, True, False),
         Count => (0, 0, 0, 1, 2, 2, 4, 1, 6, 0),
         Unknown => (False, False, False, False, False, False, True, True, True, False));
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E021 := E021 + 1;
      System.Exceptions'Elab_Spec;
      E023 := E023 + 1;
      System.Soft_Links'Elab_Body;
      E011 := E011 + 1;
      System.Secondary_Stack'Elab_Body;
      E015 := E015 + 1;
      Ada.Containers'Elab_Spec;
      E248 := E248 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E066 := E066 + 1;
      Ada.Numerics'Elab_Spec;
      E362 := E362 + 1;
      Ada.Strings'Elab_Spec;
      E179 := E179 + 1;
      Ada.Strings.Utf_Encoding'Elab_Spec;
      E285 := E285 + 1;
      Interfaces.C'Elab_Spec;
      E084 := E084 + 1;
      Interfaces.C.Strings'Elab_Spec;
      E323 := E323 + 1;
      System.Os_Lib'Elab_Body;
      E076 := E076 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E050 := E050 + 1;
      Ada.Streams'Elab_Spec;
      E065 := E065 + 1;
      System.File_Control_Block'Elab_Spec;
      E079 := E079 + 1;
      System.Finalization_Root'Elab_Spec;
      E074 := E074 + 1;
      Ada.Finalization'Elab_Spec;
      E072 := E072 + 1;
      System.File_Io'Elab_Body;
      E071 := E071 + 1;
      Ada.Streams.Stream_Io'Elab_Spec;
      E219 := E219 + 1;
      System.Storage_Pools'Elab_Spec;
      E201 := E201 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E197 := E197 + 1;
      System.Storage_Pools.Subpools'Elab_Spec;
      E195 := E195 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E178 := E178 + 1;
      Ada.Calendar.Delays'Elab_Body;
      E247 := E247 + 1;
      Ada.Calendar.Time_Zones'Elab_Spec;
      E277 := E277 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E271 := E271 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E063 := E063 + 1;
      E349 := E349 + 1;
      E351 := E351 + 1;
      Gnat.Sha1'Elab_Spec;
      E347 := E347 + 1;
      System.Assertions'Elab_Spec;
      E215 := E215 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E185 := E185 + 1;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E213 := E213 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E181 := E181 + 1;
      System.Pool_Global'Elab_Spec;
      E259 := E259 + 1;
      System.Pool_Size'Elab_Spec;
      E325 := E325 + 1;
      Gnat.Sockets'Elab_Spec;
      Gnat.Sockets.Thin_Common'Elab_Spec;
      E321 := E321 + 1;
      E316 := E316 + 1;
      Gnat.Sockets'Elab_Body;
      E313 := E313 + 1;
      System.Regexp'Elab_Spec;
      E309 := E309 + 1;
      Ada.Directories'Elab_Spec;
      Ada.Directories'Elab_Body;
      E304 := E304 + 1;
      System.Tasking.Initialization'Elab_Body;
      E146 := E146 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E156 := E156 + 1;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E160 := E160 + 1;
      System.Tasking.Queuing'Elab_Body;
      E154 := E154 + 1;
      System.Tasking.Stages'Elab_Body;
      E269 := E269 + 1;
      System.Interrupt_Management.Operations'Elab_Body;
      E410 := E410 + 1;
      System.Tasking.Async_Delays'Elab_Body;
      E408 := E408 + 1;
      CAC.OS'ELAB_SPEC;
      E082 := E082 + 1;
      Command_Line_Iterator'Elab_Spec;
      Command_Line_Iterator'Elab_Body;
      E225 := E225 + 1;
      E329 := E329 + 1;
      E387 := E387 + 1;
      E273 := E273 + 1;
      Gnoga.Server'Elab_Body;
      E302 := E302 + 1;
      E394 := E394 + 1;
      Gnoga.Types'Elab_Spec;
      E294 := E294 + 1;
      Gnoga.Server.Database'Elab_Spec;
      E398 := E398 + 1;
      Gnoga.Server.Model'Elab_Spec;
      Gnoga.Server.Model'Elab_Body;
      E400 := E400 + 1;
      Gnoga.Server.Model.Queries'Elab_Spec;
      E402 := E402 + 1;
      Gnoga.Server.Template_Parser'Elab_Spec;
      Gnoga.Server.Template_Parser'Elab_Body;
      E396 := E396 + 1;
      E404 := E404 + 1;
      Gnoga.Types.Colors'Elab_Spec;
      E420 := E420 + 1;
      Object'Elab_Spec;
      Object'Elab_Body;
      E339 := E339 + 1;
      E341 := E341 + 1;
      E343 := E343 + 1;
      Stack_Storage'Elab_Spec;
      Stack_Storage'Elab_Body;
      E385 := E385 + 1;
      Strings'Elab_Spec;
      E210 := E210 + 1;
      CAC.TRACE'ELAB_BODY;
      E090 := E090 + 1;
      CAC.TRACE.TASKS'ELAB_BODY;
      E255 := E255 + 1;
      Gnoga.Application'Elab_Body;
      E289 := E289 + 1;
      Strings_Edit'Elab_Spec;
      E333 := E333 + 1;
      E359 := E359 + 1;
      E373 := E373 + 1;
      E337 := E337 + 1;
      GNAT.SOCKETS.SERVER'ELAB_SPEC;
      GNAT.SOCKETS.SERVER'ELAB_BODY;
      E331 := E331 + 1;
      GNAT.SOCKETS.CONNECTION_STATE_MACHINE'ELAB_SPEC;
      GNAT.SOCKETS.CONNECTION_STATE_MACHINE'ELAB_BODY;
      E327 := E327 + 1;
      GNAT.SOCKETS.CONNECTION_STATE_MACHINE.BIG_ENDIAN.UNSIGNEDS'ELAB_SPEC;
      GNAT.SOCKETS.CONNECTION_STATE_MACHINE.BIG_ENDIAN.UNSIGNEDS'ELAB_BODY;
      E357 := E357 + 1;
      GNAT.SOCKETS.CONNECTION_STATE_MACHINE.EXPECTED_SEQUENCE'ELAB_SPEC;
      GNAT.SOCKETS.CONNECTION_STATE_MACHINE.EXPECTED_SEQUENCE'ELAB_BODY;
      E381 := E381 + 1;
      GNAT.SOCKETS.CONNECTION_STATE_MACHINE.TERMINATED_STRINGS'ELAB_SPEC;
      GNAT.SOCKETS.CONNECTION_STATE_MACHINE.TERMINATED_STRINGS'ELAB_BODY;
      E383 := E383 + 1;
      E369 := E369 + 1;
      Strings_Edit.Floats'Elab_Body;
      E361 := E361 + 1;
      E371 := E371 + 1;
      E406 := E406 + 1;
      E389 := E389 + 1;
      E391 := E391 + 1;
      GNAT.SOCKETS.CONNECTION_STATE_MACHINE.HTTP_SERVER'ELAB_SPEC;
      GNAT.SOCKETS.CONNECTION_STATE_MACHINE.HTTP_SERVER'ELAB_BODY;
      E345 := E345 + 1;
      Gnoga.Gui.Base'Elab_Spec;
      Gnoga.Server.Connection'Elab_Spec;
      Gnoga.Server.Connection.Common'Elab_Spec;
      E392 := E392 + 1;
      Gnoga.Server.Connection'Elab_Body;
      E311 := E311 + 1;
      Gnoga.Gui.Base'Elab_Body;
      E412 := E412 + 1;
      Gnoga.Client.Storage'Elab_Spec;
      Gnoga.Client.Storage'Elab_Body;
      E300 := E300 + 1;
      Gnoga.Gui.Element'Elab_Spec;
      Gnoga.Gui.Element'Elab_Body;
      E416 := E416 + 1;
      Gnoga.Gui.Document'Elab_Spec;
      Gnoga.Gui.Document'Elab_Body;
      E424 := E424 + 1;
      Gnoga.Gui.Element.Style_Block'Elab_Spec;
      Gnoga.Gui.Element.Style_Block'Elab_Body;
      E438 := E438 + 1;
      Gnoga.Gui.Location'Elab_Spec;
      Gnoga.Gui.Location'Elab_Body;
      E432 := E432 + 1;
      Gnoga.Gui.View'Elab_Spec;
      Gnoga.Gui.Element.Common'Elab_Spec;
      Gnoga.Gui.Element.Common'Elab_Body;
      E426 := E426 + 1;
      Gnoga.Gui.View'Elab_Body;
      E422 := E422 + 1;
      Gnoga.Gui.View.Card'Elab_Spec;
      Gnoga.Gui.View.Card'Elab_Body;
      E436 := E436 + 1;
      Gnoga.Gui.View.Docker'Elab_Spec;
      Gnoga.Gui.View.Docker'Elab_Body;
      E440 := E440 + 1;
      Gnoga.Gui.Window'Elab_Spec;
      Gnoga.Gui.Window'Elab_Body;
      E297 := E297 + 1;
      Gnoga.Application.Multi_Connect'Elab_Body;
      E291 := E291 + 1;
      Framework'Elab_Spec;
      Framework'Elab_Body;
      E245 := E245 + 1;
      Framework.Docker_View'Elab_Spec;
      Framework.Docker_View'Elab_Body;
      E434 := E434 + 1;
      Top_Window'Elab_Body;
      E243 := E243 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   /usr/local/gnat_2017/lib/components/generic_set.o
   --   /usr/local/gnat_2017/lib/components/generic_discrete_set.o
   --   /usr/local/gnat_2017/lib/components/generic_unbounded_array.o
   --   /usr/local/gnat_2017/lib/components/generic_unbounded_ptr_array.o
   --   /usr/local/gnat_2017/lib/components/object.o
   --   /usr/local/gnat_2017/lib/components/object-handle.o
   --   /usr/local/gnat_2017/lib/components/object-handle-generic_unbounded_array.o
   --   /usr/local/gnat_2017/lib/components/stack_storage.o
   --   /usr/local/gnat_2017/lib/strings_edit/strings_edit.o
   --   /usr/local/gnat_2017/lib/strings_edit/strings_edit-base64.o
   --   /usr/local/gnat_2017/lib/strings_edit/strings_edit-fields.o
   --   /usr/local/gnat_2017/lib/strings_edit/strings_edit-integer_edit.o
   --   /usr/local/gnat_2017/lib/strings_edit/strings_edit-integers.o
   --   /usr/local/gnat_2017/lib/components.connections_server/gnat-sockets-server.o
   --   /usr/local/gnat_2017/lib/components.connections_server/gnat-sockets-connection_state_machine.o
   --   /usr/local/gnat_2017/lib/components.connections_server/gnat-sockets-connection_state_machine-big_endian.o
   --   /usr/local/gnat_2017/lib/components.connections_server/gnat-sockets-connection_state_machine-big_endian-unsigneds.o
   --   /usr/local/gnat_2017/lib/components.connections_server/gnat-sockets-connection_state_machine-expected_sequence.o
   --   /usr/local/gnat_2017/lib/components.connections_server/gnat-sockets-connection_state_machine-terminated_strings.o
   --   /usr/local/gnat_2017/lib/strings_edit/strings_edit-float_edit.o
   --   /usr/local/gnat_2017/lib/strings_edit/strings_edit-floats.o
   --   /usr/local/gnat_2017/lib/strings_edit/strings_edit-quoted.o
   --   /usr/local/gnat_2017/lib/strings_edit/strings_edit-utf8.o
   --   /usr/local/gnat_2017/lib/strings_edit/strings_edit-utf8-handling.o
   --   /usr/local/gnat_2017/lib/tables/tables.o
   --   /usr/local/gnat_2017/lib/tables/tables-names.o
   --   /usr/local/gnat_2017/lib/components.connections_server.http_server/gnat-sockets-connection_state_machine-http_server.o
   --   /Users/wayne/project/gnoga/main/build/obj/top_window.o
   --   /Users/wayne/project/gnoga/main/build/obj/types.o
   --   /Users/wayne/project/gnoga/main/build/obj/main.o
   --   -L/Users/wayne/project/gnoga/main/build/obj/
   --   -L/Users/wayne/project/gnoga/main/build/obj/
   --   -L/usr/local/gnat_2017/lib/ada_lib/
   --   -L/Users/wayne/project/gnoga/main/build/lib/
   --   -L/usr/local/gnat_2017/lib/gnoga/
   --   -L/usr/local/gnat_2017/lib/components.connections_server.http_server/
   --   -L/usr/local/gnat_2017/lib/components/
   --   -L/usr/local/gnat_2017/lib/strings_edit/
   --   -L/usr/local/gnat_2017/lib/tables/
   --   -L/usr/local/gnat_2017/lib/components.connections_server/
   --   -L/usr/local/gnat_2017/lib/xpm_parser/
   --   -L/usr/local/gnat_2017/lib/gcc/x86_64-apple-darwin14.5.0/6.3.1/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
