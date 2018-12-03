package body Framework.Library is

   protected body Signal_Type is

      -------------------------------------------------------------------------
      procedure Reset is
      -------------------------------------------------------------------------

      begin
         Completed := False;
         Occured := False;
      end Reset;

      -------------------------------------------------------------------------
      procedure Set is
      -------------------------------------------------------------------------

      begin
         if Completed then
            raise Failed with "already completed in Set";
         end if;

         if Occured then
            raise Failed with "already occured";
         end if;

         Occured := True;
      end Set;

      -------------------------------------------------------------------------
      function Test return Boolean is
      -------------------------------------------------------------------------

      begin
         if Completed then
            raise Failed with "already completed in Test";
         end if;

         return Occured;
      end Test;

      -------------------------------------------------------------------------
      entry Wait when Occured is
      -------------------------------------------------------------------------

      begin
         if Completed then
            raise Failed with "already completed in Set";
         end if;

         if not One_Time then
            Occured := False;
            Completed := True;
         end if;
      end Wait;

   end Signal_Type;

end Framework.Library;
