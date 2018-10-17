pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;
with Ada.Exceptions;

package body ada_main is

   E013 : Short_Integer; pragma Import (Ada, E013, "system__soft_links_E");
   E019 : Short_Integer; pragma Import (Ada, E019, "system__exception_table_E");
   E021 : Short_Integer; pragma Import (Ada, E021, "system__exceptions_E");
   E009 : Short_Integer; pragma Import (Ada, E009, "system__secondary_stack_E");
   E284 : Short_Integer; pragma Import (Ada, E284, "ada__containers_E");
   E053 : Short_Integer; pragma Import (Ada, E053, "ada__io_exceptions_E");
   E419 : Short_Integer; pragma Import (Ada, E419, "ada__numerics_E");
   E246 : Short_Integer; pragma Import (Ada, E246, "ada__strings_E");
   E342 : Short_Integer; pragma Import (Ada, E342, "ada__strings__utf_encoding_E");
   E105 : Short_Integer; pragma Import (Ada, E105, "interfaces__c_E");
   E380 : Short_Integer; pragma Import (Ada, E380, "interfaces__c__strings_E");
   E078 : Short_Integer; pragma Import (Ada, E078, "system__os_lib_E");
   E202 : Short_Integer; pragma Import (Ada, E202, "system__task_primitives__interrupt_operations_E");
   E055 : Short_Integer; pragma Import (Ada, E055, "ada__tags_E");
   E052 : Short_Integer; pragma Import (Ada, E052, "ada__streams_E");
   E081 : Short_Integer; pragma Import (Ada, E081, "system__file_control_block_E");
   E076 : Short_Integer; pragma Import (Ada, E076, "system__finalization_root_E");
   E074 : Short_Integer; pragma Import (Ada, E074, "ada__finalization_E");
   E073 : Short_Integer; pragma Import (Ada, E073, "system__file_io_E");
   E277 : Short_Integer; pragma Import (Ada, E277, "ada__streams__stream_io_E");
   E116 : Short_Integer; pragma Import (Ada, E116, "system__storage_pools_E");
   E110 : Short_Integer; pragma Import (Ada, E110, "system__finalization_masters_E");
   E262 : Short_Integer; pragma Import (Ada, E262, "system__storage_pools__subpools_E");
   E103 : Short_Integer; pragma Import (Ada, E103, "ada__calendar_E");
   E328 : Short_Integer; pragma Import (Ada, E328, "ada__calendar__delays_E");
   E334 : Short_Integer; pragma Import (Ada, E334, "ada__calendar__time_zones_E");
   E198 : Short_Integer; pragma Import (Ada, E198, "ada__real_time_E");
   E068 : Short_Integer; pragma Import (Ada, E068, "ada__text_io_E");
   E406 : Short_Integer; pragma Import (Ada, E406, "gnat__secure_hashes_E");
   E408 : Short_Integer; pragma Import (Ada, E408, "gnat__secure_hashes__sha1_E");
   E404 : Short_Integer; pragma Import (Ada, E404, "gnat__sha1_E");
   E273 : Short_Integer; pragma Import (Ada, E273, "system__assertions_E");
   E252 : Short_Integer; pragma Import (Ada, E252, "ada__strings__maps_E");
   E271 : Short_Integer; pragma Import (Ada, E271, "ada__strings__maps__constants_E");
   E248 : Short_Integer; pragma Import (Ada, E248, "ada__strings__unbounded_E");
   E306 : Short_Integer; pragma Import (Ada, E306, "system__regpat_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "system__pool_global_E");
   E382 : Short_Integer; pragma Import (Ada, E382, "system__pool_size_E");
   E370 : Short_Integer; pragma Import (Ada, E370, "gnat__sockets_E");
   E378 : Short_Integer; pragma Import (Ada, E378, "gnat__sockets__thin_common_E");
   E373 : Short_Integer; pragma Import (Ada, E373, "gnat__sockets__thin_E");
   E366 : Short_Integer; pragma Import (Ada, E366, "system__regexp_E");
   E361 : Short_Integer; pragma Import (Ada, E361, "ada__directories_E");
   E176 : Short_Integer; pragma Import (Ada, E176, "system__tasking__initialization_E");
   E186 : Short_Integer; pragma Import (Ada, E186, "system__tasking__protected_objects_E");
   E190 : Short_Integer; pragma Import (Ada, E190, "system__tasking__protected_objects__entries_E");
   E184 : Short_Integer; pragma Import (Ada, E184, "system__tasking__queuing_E");
   E210 : Short_Integer; pragma Import (Ada, E210, "system__tasking__stages_E");
   E200 : Short_Integer; pragma Import (Ada, E200, "system__interrupt_management__operations_E");
   E196 : Short_Integer; pragma Import (Ada, E196, "system__interrupts_E");
   E465 : Short_Integer; pragma Import (Ada, E465, "system__tasking__async_delays_E");
   E083 : Short_Integer; pragma Import (Ada, E083, "aunit_E");
   E085 : Short_Integer; pragma Import (Ada, E085, "aunit__memory_E");
   E097 : Short_Integer; pragma Import (Ada, E097, "aunit__memory__utils_E");
   E095 : Short_Integer; pragma Import (Ada, E095, "ada_containers__aunit_lists_E");
   E108 : Short_Integer; pragma Import (Ada, E108, "aunit__tests_E");
   E101 : Short_Integer; pragma Import (Ada, E101, "aunit__time_measure_E");
   E099 : Short_Integer; pragma Import (Ada, E099, "aunit__test_results_E");
   E092 : Short_Integer; pragma Import (Ada, E092, "aunit__assertions_E");
   E088 : Short_Integer; pragma Import (Ada, E088, "aunit__test_filters_E");
   E090 : Short_Integer; pragma Import (Ada, E090, "aunit__simple_test_cases_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "aunit__reporter_E");
   E128 : Short_Integer; pragma Import (Ada, E128, "aunit__reporter__text_E");
   E493 : Short_Integer; pragma Import (Ada, E493, "aunit__test_fixtures_E");
   E491 : Short_Integer; pragma Import (Ada, E491, "aunit__test_caller_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "aunit__test_suites_E");
   E136 : Short_Integer; pragma Import (Ada, E136, "aunit__run_E");
   E293 : Short_Integer; pragma Import (Ada, E293, "cac__interrupt_names_E");
   E296 : Short_Integer; pragma Import (Ada, E296, "cac__os_E");
   E314 : Short_Integer; pragma Import (Ada, E314, "command_line_iterator_E");
   E386 : Short_Integer; pragma Import (Ada, E386, "generic_unbounded_array_E");
   E444 : Short_Integer; pragma Import (Ada, E444, "generic_unbounded_ptr_array_E");
   E330 : Short_Integer; pragma Import (Ada, E330, "gnoga_E");
   E359 : Short_Integer; pragma Import (Ada, E359, "gnoga__server_E");
   E451 : Short_Integer; pragma Import (Ada, E451, "gnoga__server__mime_E");
   E351 : Short_Integer; pragma Import (Ada, E351, "gnoga__types_E");
   E455 : Short_Integer; pragma Import (Ada, E455, "gnoga__server__database_E");
   E457 : Short_Integer; pragma Import (Ada, E457, "gnoga__server__model_E");
   E459 : Short_Integer; pragma Import (Ada, E459, "gnoga__server__model__queries_E");
   E453 : Short_Integer; pragma Import (Ada, E453, "gnoga__server__template_parser_E");
   E461 : Short_Integer; pragma Import (Ada, E461, "gnoga__server__template_parser__simple_E");
   E475 : Short_Integer; pragma Import (Ada, E475, "gnoga__types__colors_E");
   E396 : Short_Integer; pragma Import (Ada, E396, "object_E");
   E398 : Short_Integer; pragma Import (Ada, E398, "object__handle_E");
   E400 : Short_Integer; pragma Import (Ada, E400, "object__handle__generic_unbounded_array_E");
   E442 : Short_Integer; pragma Import (Ada, E442, "stack_storage_E");
   E268 : Short_Integer; pragma Import (Ada, E268, "strings_E");
   E212 : Short_Integer; pragma Import (Ada, E212, "cac__trace_E");
   E303 : Short_Integer; pragma Import (Ada, E303, "cac__reg_edit_E");
   E283 : Short_Integer; pragma Import (Ada, E283, "cac__trace__tasks_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "cac__interrupt_E");
   E299 : Short_Integer; pragma Import (Ada, E299, "cac__unit_test_E");
   E301 : Short_Integer; pragma Import (Ada, E301, "cac__unit_test__expression_filter_E");
   E346 : Short_Integer; pragma Import (Ada, E346, "gnoga__application_E");
   E503 : Short_Integer; pragma Import (Ada, E503, "lock_E");
   E501 : Short_Integer; pragma Import (Ada, E501, "cac__auto_lock_E");
   E505 : Short_Integer; pragma Import (Ada, E505, "strings__bounded_E");
   E499 : Short_Integer; pragma Import (Ada, E499, "cac__database_E");
   E497 : Short_Integer; pragma Import (Ada, E497, "cac__unit_test__setup_E");
   E507 : Short_Integer; pragma Import (Ada, E507, "cac__database__aunit_setup_E");
   E390 : Short_Integer; pragma Import (Ada, E390, "strings_edit_E");
   E416 : Short_Integer; pragma Import (Ada, E416, "strings_edit__base64_E");
   E430 : Short_Integer; pragma Import (Ada, E430, "strings_edit__fields_E");
   E394 : Short_Integer; pragma Import (Ada, E394, "strings_edit__integer_edit_E");
   E388 : Short_Integer; pragma Import (Ada, E388, "gnat__sockets__server_E");
   E384 : Short_Integer; pragma Import (Ada, E384, "gnat__sockets__connection_state_machine_E");
   E414 : Short_Integer; pragma Import (Ada, E414, "gnat__sockets__connection_state_machine__big_endian__unsigneds_E");
   E438 : Short_Integer; pragma Import (Ada, E438, "gnat__sockets__connection_state_machine__expected_sequence_E");
   E440 : Short_Integer; pragma Import (Ada, E440, "gnat__sockets__connection_state_machine__terminated_strings_E");
   E426 : Short_Integer; pragma Import (Ada, E426, "strings_edit__float_edit_E");
   E418 : Short_Integer; pragma Import (Ada, E418, "strings_edit__floats_E");
   E417 : Short_Integer; pragma Import (Ada, E417, "strings_edit__floats_E");
   E428 : Short_Integer; pragma Import (Ada, E428, "strings_edit__quoted_E");
   E463 : Short_Integer; pragma Import (Ada, E463, "strings_edit__utf8__handling_E");
   E446 : Short_Integer; pragma Import (Ada, E446, "tables_E");
   E448 : Short_Integer; pragma Import (Ada, E448, "tables__names_E");
   E402 : Short_Integer; pragma Import (Ada, E402, "gnat__sockets__connection_state_machine__http_server_E");
   E467 : Short_Integer; pragma Import (Ada, E467, "gnoga__gui__base_E");
   E368 : Short_Integer; pragma Import (Ada, E368, "gnoga__server__connection_E");
   E449 : Short_Integer; pragma Import (Ada, E449, "gnoga__server__connection__common_E");
   E357 : Short_Integer; pragma Import (Ada, E357, "gnoga__client__storage_E");
   E471 : Short_Integer; pragma Import (Ada, E471, "gnoga__gui__element_E");
   E479 : Short_Integer; pragma Import (Ada, E479, "gnoga__gui__document_E");
   E522 : Short_Integer; pragma Import (Ada, E522, "gnoga__gui__element__style_block_E");
   E487 : Short_Integer; pragma Import (Ada, E487, "gnoga__gui__location_E");
   E477 : Short_Integer; pragma Import (Ada, E477, "gnoga__gui__view_E");
   E481 : Short_Integer; pragma Import (Ada, E481, "gnoga__gui__element__common_E");
   E510 : Short_Integer; pragma Import (Ada, E510, "gnoga__gui__element__form_E");
   E520 : Short_Integer; pragma Import (Ada, E520, "gnoga__gui__view__card_E");
   E524 : Short_Integer; pragma Import (Ada, E524, "gnoga__gui__view__docker_E");
   E354 : Short_Integer; pragma Import (Ada, E354, "gnoga__gui__window_E");
   E348 : Short_Integer; pragma Import (Ada, E348, "gnoga__application__multi_connect_E");
   E326 : Short_Integer; pragma Import (Ada, E326, "framework_E");
   E518 : Short_Integer; pragma Import (Ada, E518, "framework__docker_view_E");
   E495 : Short_Integer; pragma Import (Ada, E495, "main_tests_E");
   E489 : Short_Integer; pragma Import (Ada, E489, "main_suite_E");
   E516 : Short_Integer; pragma Import (Ada, E516, "top_window_E");
   E514 : Short_Integer; pragma Import (Ada, E514, "top_window_tests_E");
   E512 : Short_Integer; pragma Import (Ada, E512, "top_window_suite_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      declare
         procedure F1;
         pragma Import (Ada, F1, "top_window_suite__finalize_body");
      begin
         E512 := E512 - 1;
         F1;
      end;
      E514 := E514 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "top_window_tests__finalize_spec");
      begin
         F2;
      end;
      E516 := E516 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "top_window__finalize_spec");
      begin
         F3;
      end;
      declare
         procedure F4;
         pragma Import (Ada, F4, "main_suite__finalize_body");
      begin
         E489 := E489 - 1;
         F4;
      end;
      E495 := E495 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "main_tests__finalize_spec");
      begin
         F5;
      end;
      E518 := E518 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "framework__docker_view__finalize_spec");
      begin
         F6;
      end;
      declare
         procedure F7;
         pragma Import (Ada, F7, "framework__finalize_body");
      begin
         E326 := E326 - 1;
         F7;
      end;
      declare
         procedure F8;
         pragma Import (Ada, F8, "framework__finalize_spec");
      begin
         F8;
      end;
      declare
         procedure F9;
         pragma Import (Ada, F9, "gnoga__application__multi_connect__finalize_body");
      begin
         E348 := E348 - 1;
         F9;
      end;
      E354 := E354 - 1;
      declare
         procedure F10;
         pragma Import (Ada, F10, "gnoga__gui__window__finalize_spec");
      begin
         F10;
      end;
      E524 := E524 - 1;
      declare
         procedure F11;
         pragma Import (Ada, F11, "gnoga__gui__view__docker__finalize_spec");
      begin
         F11;
      end;
      E520 := E520 - 1;
      declare
         procedure F12;
         pragma Import (Ada, F12, "gnoga__gui__view__card__finalize_spec");
      begin
         F12;
      end;
      E510 := E510 - 1;
      declare
         procedure F13;
         pragma Import (Ada, F13, "gnoga__gui__element__form__finalize_spec");
      begin
         F13;
      end;
      E477 := E477 - 1;
      E481 := E481 - 1;
      declare
         procedure F14;
         pragma Import (Ada, F14, "gnoga__gui__element__common__finalize_spec");
      begin
         F14;
      end;
      declare
         procedure F15;
         pragma Import (Ada, F15, "gnoga__gui__view__finalize_spec");
      begin
         F15;
      end;
      E487 := E487 - 1;
      declare
         procedure F16;
         pragma Import (Ada, F16, "gnoga__gui__location__finalize_spec");
      begin
         F16;
      end;
      E522 := E522 - 1;
      declare
         procedure F17;
         pragma Import (Ada, F17, "gnoga__gui__element__style_block__finalize_spec");
      begin
         F17;
      end;
      E479 := E479 - 1;
      declare
         procedure F18;
         pragma Import (Ada, F18, "gnoga__gui__document__finalize_spec");
      begin
         F18;
      end;
      E471 := E471 - 1;
      declare
         procedure F19;
         pragma Import (Ada, F19, "gnoga__gui__element__finalize_spec");
      begin
         F19;
      end;
      E357 := E357 - 1;
      declare
         procedure F20;
         pragma Import (Ada, F20, "gnoga__client__storage__finalize_spec");
      begin
         F20;
      end;
      E467 := E467 - 1;
      declare
         procedure F21;
         pragma Import (Ada, F21, "gnoga__server__connection__finalize_body");
      begin
         E368 := E368 - 1;
         F21;
      end;
      declare
         procedure F22;
         pragma Import (Ada, F22, "gnoga__server__connection__common__finalize_spec");
      begin
         E449 := E449 - 1;
         F22;
      end;
      declare
         procedure F23;
         pragma Import (Ada, F23, "gnoga__gui__base__finalize_spec");
      begin
         F23;
      end;
      E402 := E402 - 1;
      declare
         procedure F24;
         pragma Import (Ada, F24, "gnat__sockets__connection_state_machine__http_server__finalize_spec");
      begin
         F24;
      end;
      E440 := E440 - 1;
      declare
         procedure F25;
         pragma Import (Ada, F25, "gnat__sockets__connection_state_machine__terminated_strings__finalize_spec");
      begin
         F25;
      end;
      E438 := E438 - 1;
      declare
         procedure F26;
         pragma Import (Ada, F26, "gnat__sockets__connection_state_machine__expected_sequence__finalize_spec");
      begin
         F26;
      end;
      E414 := E414 - 1;
      declare
         procedure F27;
         pragma Import (Ada, F27, "gnat__sockets__connection_state_machine__big_endian__unsigneds__finalize_spec");
      begin
         F27;
      end;
      declare
         procedure F28;
         pragma Import (Ada, F28, "gnat__sockets__connection_state_machine__finalize_body");
      begin
         E384 := E384 - 1;
         F28;
      end;
      declare
         procedure F29;
         pragma Import (Ada, F29, "gnat__sockets__connection_state_machine__finalize_spec");
      begin
         F29;
      end;
      E388 := E388 - 1;
      declare
         procedure F30;
         pragma Import (Ada, F30, "gnat__sockets__server__finalize_spec");
      begin
         F30;
      end;
      E507 := E507 - 1;
      declare
         procedure F31;
         pragma Import (Ada, F31, "cac__database__aunit_setup__finalize_spec");
      begin
         F31;
      end;
      E499 := E499 - 1;
      declare
         procedure F32;
         pragma Import (Ada, F32, "cac__database__finalize_spec");
      begin
         F32;
      end;
      E505 := E505 - 1;
      declare
         procedure F33;
         pragma Import (Ada, F33, "strings__bounded__finalize_spec");
      begin
         F33;
      end;
      E501 := E501 - 1;
      declare
         procedure F34;
         pragma Import (Ada, F34, "cac__auto_lock__finalize_spec");
      begin
         F34;
      end;
      declare
         procedure F35;
         pragma Import (Ada, F35, "gnoga__application__finalize_body");
      begin
         E346 := E346 - 1;
         F35;
      end;
      E301 := E301 - 1;
      declare
         procedure F36;
         pragma Import (Ada, F36, "cac__unit_test__expression_filter__finalize_spec");
      begin
         F36;
      end;
      E141 := E141 - 1;
      declare
         procedure F37;
         pragma Import (Ada, F37, "cac__interrupt__finalize_spec");
      begin
         F37;
      end;
      declare
         procedure F38;
         pragma Import (Ada, F38, "cac__trace__tasks__finalize_body");
      begin
         E283 := E283 - 1;
         F38;
      end;
      E303 := E303 - 1;
      declare
         procedure F39;
         pragma Import (Ada, F39, "cac__reg_edit__finalize_spec");
      begin
         F39;
      end;
      E442 := E442 - 1;
      declare
         procedure F40;
         pragma Import (Ada, F40, "stack_storage__finalize_spec");
      begin
         F40;
      end;
      E396 := E396 - 1;
      declare
         procedure F41;
         pragma Import (Ada, F41, "object__finalize_spec");
      begin
         F41;
      end;
      declare
         procedure F42;
         pragma Import (Ada, F42, "gnoga__server__template_parser__finalize_body");
      begin
         E453 := E453 - 1;
         F42;
      end;
      declare
         procedure F43;
         pragma Import (Ada, F43, "gnoga__server__template_parser__finalize_spec");
      begin
         F43;
      end;
      E459 := E459 - 1;
      declare
         procedure F44;
         pragma Import (Ada, F44, "gnoga__server__model__queries__finalize_spec");
      begin
         F44;
      end;
      E457 := E457 - 1;
      declare
         procedure F45;
         pragma Import (Ada, F45, "gnoga__server__model__finalize_spec");
      begin
         F45;
      end;
      E455 := E455 - 1;
      declare
         procedure F46;
         pragma Import (Ada, F46, "gnoga__server__database__finalize_spec");
      begin
         F46;
      end;
      E351 := E351 - 1;
      declare
         procedure F47;
         pragma Import (Ada, F47, "gnoga__types__finalize_spec");
      begin
         F47;
      end;
      E314 := E314 - 1;
      declare
         procedure F48;
         pragma Import (Ada, F48, "command_line_iterator__finalize_spec");
      begin
         F48;
      end;
      declare
         procedure F49;
         pragma Import (Ada, F49, "cac__interrupt_names__finalize_body");
      begin
         E293 := E293 - 1;
         F49;
      end;
      E138 := E138 - 1;
      declare
         procedure F50;
         pragma Import (Ada, F50, "aunit__test_suites__finalize_spec");
      begin
         F50;
      end;
      E493 := E493 - 1;
      declare
         procedure F51;
         pragma Import (Ada, F51, "aunit__test_fixtures__finalize_spec");
      begin
         F51;
      end;
      E128 := E128 - 1;
      declare
         procedure F52;
         pragma Import (Ada, F52, "aunit__reporter__text__finalize_spec");
      begin
         F52;
      end;
      E088 := E088 - 1;
      E090 := E090 - 1;
      declare
         procedure F53;
         pragma Import (Ada, F53, "aunit__simple_test_cases__finalize_spec");
      begin
         F53;
      end;
      declare
         procedure F54;
         pragma Import (Ada, F54, "aunit__test_filters__finalize_spec");
      begin
         F54;
      end;
      E092 := E092 - 1;
      declare
         procedure F55;
         pragma Import (Ada, F55, "aunit__assertions__finalize_spec");
      begin
         F55;
      end;
      E099 := E099 - 1;
      declare
         procedure F56;
         pragma Import (Ada, F56, "aunit__test_results__finalize_spec");
      begin
         F56;
      end;
      declare
         procedure F57;
         pragma Import (Ada, F57, "aunit__tests__finalize_spec");
      begin
         E108 := E108 - 1;
         F57;
      end;
      E196 := E196 - 1;
      declare
         procedure F58;
         pragma Import (Ada, F58, "system__interrupts__finalize_spec");
      begin
         F58;
      end;
      E190 := E190 - 1;
      declare
         procedure F59;
         pragma Import (Ada, F59, "system__tasking__protected_objects__entries__finalize_spec");
      begin
         F59;
      end;
      E361 := E361 - 1;
      declare
         procedure F60;
         pragma Import (Ada, F60, "ada__directories__finalize_spec");
      begin
         F60;
      end;
      E366 := E366 - 1;
      declare
         procedure F61;
         pragma Import (Ada, F61, "system__regexp__finalize_spec");
      begin
         F61;
      end;
      declare
         procedure F62;
         pragma Import (Ada, F62, "gnat__sockets__finalize_body");
      begin
         E370 := E370 - 1;
         F62;
      end;
      declare
         procedure F63;
         pragma Import (Ada, F63, "gnat__sockets__finalize_spec");
      begin
         F63;
      end;
      E382 := E382 - 1;
      declare
         procedure F64;
         pragma Import (Ada, F64, "system__pool_size__finalize_spec");
      begin
         F64;
      end;
      E118 := E118 - 1;
      declare
         procedure F65;
         pragma Import (Ada, F65, "system__pool_global__finalize_spec");
      begin
         F65;
      end;
      E248 := E248 - 1;
      declare
         procedure F66;
         pragma Import (Ada, F66, "ada__strings__unbounded__finalize_spec");
      begin
         F66;
      end;
      E068 := E068 - 1;
      declare
         procedure F67;
         pragma Import (Ada, F67, "ada__text_io__finalize_spec");
      begin
         F67;
      end;
      E262 := E262 - 1;
      declare
         procedure F68;
         pragma Import (Ada, F68, "system__storage_pools__subpools__finalize_spec");
      begin
         F68;
      end;
      E110 := E110 - 1;
      declare
         procedure F69;
         pragma Import (Ada, F69, "system__finalization_masters__finalize_spec");
      begin
         F69;
      end;
      E277 := E277 - 1;
      declare
         procedure F70;
         pragma Import (Ada, F70, "ada__streams__stream_io__finalize_spec");
      begin
         F70;
      end;
      declare
         procedure F71;
         pragma Import (Ada, F71, "system__file_io__finalize_body");
      begin
         E073 := E073 - 1;
         F71;
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
           False, False, True, True, True, True, True, False, 
           True, True, False, True, True, False, True, True, 
           False, True, True, True, True, False, True, False, 
           False, False, True, False, True, True, False, True, 
           True, True, True, False, True, False, True, True, 
           False, True, True, False, True, True, False, True, 
           False, False, True, False, True, True, True, False, 
           False, True, False, True, True, True, False, True, 
           True, False, True, True, True, True, False, True, 
           True, False, False, False, True, True, True, True, 
           True, True, False),
         Count => (0, 0, 0, 1, 9, 10, 6, 1, 7, 0),
         Unknown => (False, False, False, False, False, False, True, True, True, False));
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 1;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E019 := E019 + 1;
      System.Exceptions'Elab_Spec;
      E021 := E021 + 1;
      System.Soft_Links'Elab_Body;
      E013 := E013 + 1;
      System.Secondary_Stack'Elab_Body;
      E009 := E009 + 1;
      Ada.Containers'Elab_Spec;
      E284 := E284 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E053 := E053 + 1;
      Ada.Numerics'Elab_Spec;
      E419 := E419 + 1;
      Ada.Strings'Elab_Spec;
      E246 := E246 + 1;
      Ada.Strings.Utf_Encoding'Elab_Spec;
      E342 := E342 + 1;
      Interfaces.C'Elab_Spec;
      E105 := E105 + 1;
      Interfaces.C.Strings'Elab_Spec;
      E380 := E380 + 1;
      System.Os_Lib'Elab_Body;
      E078 := E078 + 1;
      System.Task_Primitives.Interrupt_Operations'Elab_Body;
      E202 := E202 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E055 := E055 + 1;
      Ada.Streams'Elab_Spec;
      E052 := E052 + 1;
      System.File_Control_Block'Elab_Spec;
      E081 := E081 + 1;
      System.Finalization_Root'Elab_Spec;
      E076 := E076 + 1;
      Ada.Finalization'Elab_Spec;
      E074 := E074 + 1;
      System.File_Io'Elab_Body;
      E073 := E073 + 1;
      Ada.Streams.Stream_Io'Elab_Spec;
      E277 := E277 + 1;
      System.Storage_Pools'Elab_Spec;
      E116 := E116 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E110 := E110 + 1;
      System.Storage_Pools.Subpools'Elab_Spec;
      E262 := E262 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E103 := E103 + 1;
      Ada.Calendar.Delays'Elab_Body;
      E328 := E328 + 1;
      Ada.Calendar.Time_Zones'Elab_Spec;
      E334 := E334 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E198 := E198 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E068 := E068 + 1;
      E406 := E406 + 1;
      E408 := E408 + 1;
      Gnat.Sha1'Elab_Spec;
      E404 := E404 + 1;
      System.Assertions'Elab_Spec;
      E273 := E273 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E252 := E252 + 1;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E271 := E271 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E248 := E248 + 1;
      System.Regpat'Elab_Spec;
      E306 := E306 + 1;
      System.Pool_Global'Elab_Spec;
      E118 := E118 + 1;
      System.Pool_Size'Elab_Spec;
      E382 := E382 + 1;
      Gnat.Sockets'Elab_Spec;
      Gnat.Sockets.Thin_Common'Elab_Spec;
      E378 := E378 + 1;
      E373 := E373 + 1;
      Gnat.Sockets'Elab_Body;
      E370 := E370 + 1;
      System.Regexp'Elab_Spec;
      E366 := E366 + 1;
      Ada.Directories'Elab_Spec;
      Ada.Directories'Elab_Body;
      E361 := E361 + 1;
      System.Tasking.Initialization'Elab_Body;
      E176 := E176 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E186 := E186 + 1;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E190 := E190 + 1;
      System.Tasking.Queuing'Elab_Body;
      E184 := E184 + 1;
      System.Tasking.Stages'Elab_Body;
      E210 := E210 + 1;
      System.Interrupt_Management.Operations'Elab_Body;
      E200 := E200 + 1;
      System.Interrupts'Elab_Spec;
      System.Interrupts'Elab_Body;
      E196 := E196 + 1;
      System.Tasking.Async_Delays'Elab_Body;
      E465 := E465 + 1;
      E085 := E085 + 1;
      E083 := E083 + 1;
      E097 := E097 + 1;
      E095 := E095 + 1;
      Aunit.Tests'Elab_Spec;
      E108 := E108 + 1;
      Aunit.Time_Measure'Elab_Spec;
      E101 := E101 + 1;
      Aunit.Test_Results'Elab_Spec;
      E099 := E099 + 1;
      Aunit.Assertions'Elab_Spec;
      Aunit.Assertions'Elab_Body;
      E092 := E092 + 1;
      Aunit.Test_Filters'Elab_Spec;
      Aunit.Simple_Test_Cases'Elab_Spec;
      E090 := E090 + 1;
      E088 := E088 + 1;
      Aunit.Reporter'Elab_Spec;
      E126 := E126 + 1;
      Aunit.Reporter.Text'Elab_Spec;
      E128 := E128 + 1;
      Aunit.Test_Fixtures'Elab_Spec;
      E493 := E493 + 1;
      E491 := E491 + 1;
      Aunit.Test_Suites'Elab_Spec;
      E138 := E138 + 1;
      E136 := E136 + 1;
      CAC.INTERRUPT_NAMES'ELAB_BODY;
      E293 := E293 + 1;
      CAC.OS'ELAB_SPEC;
      E296 := E296 + 1;
      Command_Line_Iterator'Elab_Spec;
      Command_Line_Iterator'Elab_Body;
      E314 := E314 + 1;
      E386 := E386 + 1;
      E444 := E444 + 1;
      E330 := E330 + 1;
      Gnoga.Server'Elab_Body;
      E359 := E359 + 1;
      E451 := E451 + 1;
      Gnoga.Types'Elab_Spec;
      E351 := E351 + 1;
      Gnoga.Server.Database'Elab_Spec;
      E455 := E455 + 1;
      Gnoga.Server.Model'Elab_Spec;
      Gnoga.Server.Model'Elab_Body;
      E457 := E457 + 1;
      Gnoga.Server.Model.Queries'Elab_Spec;
      E459 := E459 + 1;
      Gnoga.Server.Template_Parser'Elab_Spec;
      Gnoga.Server.Template_Parser'Elab_Body;
      E453 := E453 + 1;
      E461 := E461 + 1;
      Gnoga.Types.Colors'Elab_Spec;
      E475 := E475 + 1;
      Object'Elab_Spec;
      Object'Elab_Body;
      E396 := E396 + 1;
      E398 := E398 + 1;
      E400 := E400 + 1;
      Stack_Storage'Elab_Spec;
      Stack_Storage'Elab_Body;
      E442 := E442 + 1;
      Strings'Elab_Spec;
      E268 := E268 + 1;
      CAC.TRACE'ELAB_BODY;
      E212 := E212 + 1;
      CAC.REG_EDIT'ELAB_SPEC;
      CAC.REG_EDIT'ELAB_BODY;
      E303 := E303 + 1;
      CAC.TRACE.TASKS'ELAB_BODY;
      E283 := E283 + 1;
      CAC.INTERRUPT'ELAB_SPEC;
      CAC.INTERRUPT'ELAB_BODY;
      E141 := E141 + 1;
      E299 := E299 + 1;
      CAC.UNIT_TEST.EXPRESSION_FILTER'ELAB_SPEC;
      CAC.UNIT_TEST.EXPRESSION_FILTER'ELAB_BODY;
      E301 := E301 + 1;
      Gnoga.Application'Elab_Body;
      E346 := E346 + 1;
      Lock'Elab_Spec;
      E503 := E503 + 1;
      CAC.AUTO_LOCK'ELAB_SPEC;
      CAC.AUTO_LOCK'ELAB_BODY;
      E501 := E501 + 1;
      Strings.Bounded'Elab_Spec;
      Strings.Bounded'Elab_Body;
      E505 := E505 + 1;
      CAC.DATABASE'ELAB_SPEC;
      CAC.DATABASE'ELAB_BODY;
      E499 := E499 + 1;
      CAC.UNIT_TEST.SETUP'ELAB_SPEC;
      CAC.DATABASE.AUNIT_SETUP'ELAB_SPEC;
      CAC.UNIT_TEST.SETUP'ELAB_BODY;
      E497 := E497 + 1;
      CAC.DATABASE.AUNIT_SETUP'ELAB_BODY;
      E507 := E507 + 1;
      Strings_Edit'Elab_Spec;
      E390 := E390 + 1;
      E416 := E416 + 1;
      E430 := E430 + 1;
      E394 := E394 + 1;
      GNAT.SOCKETS.SERVER'ELAB_SPEC;
      GNAT.SOCKETS.SERVER'ELAB_BODY;
      E388 := E388 + 1;
      GNAT.SOCKETS.CONNECTION_STATE_MACHINE'ELAB_SPEC;
      GNAT.SOCKETS.CONNECTION_STATE_MACHINE'ELAB_BODY;
      E384 := E384 + 1;
      GNAT.SOCKETS.CONNECTION_STATE_MACHINE.BIG_ENDIAN.UNSIGNEDS'ELAB_SPEC;
      GNAT.SOCKETS.CONNECTION_STATE_MACHINE.BIG_ENDIAN.UNSIGNEDS'ELAB_BODY;
      E414 := E414 + 1;
      GNAT.SOCKETS.CONNECTION_STATE_MACHINE.EXPECTED_SEQUENCE'ELAB_SPEC;
      GNAT.SOCKETS.CONNECTION_STATE_MACHINE.EXPECTED_SEQUENCE'ELAB_BODY;
      E438 := E438 + 1;
      GNAT.SOCKETS.CONNECTION_STATE_MACHINE.TERMINATED_STRINGS'ELAB_SPEC;
      GNAT.SOCKETS.CONNECTION_STATE_MACHINE.TERMINATED_STRINGS'ELAB_BODY;
      E440 := E440 + 1;
      E426 := E426 + 1;
      Strings_Edit.Floats'Elab_Body;
      E418 := E418 + 1;
      E428 := E428 + 1;
      E463 := E463 + 1;
      E446 := E446 + 1;
      E448 := E448 + 1;
      GNAT.SOCKETS.CONNECTION_STATE_MACHINE.HTTP_SERVER'ELAB_SPEC;
      GNAT.SOCKETS.CONNECTION_STATE_MACHINE.HTTP_SERVER'ELAB_BODY;
      E402 := E402 + 1;
      Gnoga.Gui.Base'Elab_Spec;
      Gnoga.Server.Connection'Elab_Spec;
      Gnoga.Server.Connection.Common'Elab_Spec;
      E449 := E449 + 1;
      Gnoga.Server.Connection'Elab_Body;
      E368 := E368 + 1;
      Gnoga.Gui.Base'Elab_Body;
      E467 := E467 + 1;
      Gnoga.Client.Storage'Elab_Spec;
      Gnoga.Client.Storage'Elab_Body;
      E357 := E357 + 1;
      Gnoga.Gui.Element'Elab_Spec;
      Gnoga.Gui.Element'Elab_Body;
      E471 := E471 + 1;
      Gnoga.Gui.Document'Elab_Spec;
      Gnoga.Gui.Document'Elab_Body;
      E479 := E479 + 1;
      Gnoga.Gui.Element.Style_Block'Elab_Spec;
      Gnoga.Gui.Element.Style_Block'Elab_Body;
      E522 := E522 + 1;
      Gnoga.Gui.Location'Elab_Spec;
      Gnoga.Gui.Location'Elab_Body;
      E487 := E487 + 1;
      Gnoga.Gui.View'Elab_Spec;
      Gnoga.Gui.Element.Common'Elab_Spec;
      Gnoga.Gui.Element.Common'Elab_Body;
      E481 := E481 + 1;
      Gnoga.Gui.View'Elab_Body;
      E477 := E477 + 1;
      Gnoga.Gui.Element.Form'Elab_Spec;
      Gnoga.Gui.Element.Form'Elab_Body;
      E510 := E510 + 1;
      Gnoga.Gui.View.Card'Elab_Spec;
      Gnoga.Gui.View.Card'Elab_Body;
      E520 := E520 + 1;
      Gnoga.Gui.View.Docker'Elab_Spec;
      Gnoga.Gui.View.Docker'Elab_Body;
      E524 := E524 + 1;
      Gnoga.Gui.Window'Elab_Spec;
      Gnoga.Gui.Window'Elab_Body;
      E354 := E354 + 1;
      Gnoga.Application.Multi_Connect'Elab_Body;
      E348 := E348 + 1;
      Framework'Elab_Spec;
      Framework'Elab_Body;
      E326 := E326 + 1;
      Framework.Docker_View'Elab_Spec;
      Framework.Docker_View'Elab_Body;
      E518 := E518 + 1;
      Main_Tests'Elab_Spec;
      Main_Tests'Elab_Body;
      E495 := E495 + 1;
      Main_Suite'Elab_Body;
      E489 := E489 + 1;
      Top_Window'Elab_Spec;
      Top_Window'Elab_Body;
      E516 := E516 + 1;
      Top_Window_Tests'Elab_Spec;
      Top_Window_Tests'Elab_Body;
      E514 := E514 + 1;
      Top_Window_Suite'Elab_Body;
      E512 := E512 + 1;
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
   --   /Users/wayne/project/gnoga/aunit/build/obj/main_tests.o
   --   /Users/wayne/project/gnoga/aunit/build/obj/main_suite.o
   --   /Users/wayne/project/gnoga/aunit/build/obj/top_window_tests.o
   --   /Users/wayne/project/gnoga/aunit/build/obj/top_window_suite.o
   --   /Users/wayne/project/gnoga/aunit/build/obj/main.o
   --   -L/Users/wayne/project/gnoga/aunit/build/obj/
   --   -L/Users/wayne/project/gnoga/aunit/build/obj/
   --   -L/usr/local/gnat_2017/lib/ada_lib/
   --   -L/usr/local/gnat_2017/lib/ada_lib_aunit_lib/
   --   -L/usr/local/gnat_2017/lib/aunit/
   --   -L/Users/wayne/project/gnoga/aunit/build/lib/
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
