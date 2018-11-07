package Main_Lib is

   Failed                        : exception;

   protected type Signal_Type (
      One_Time                   : Boolean) is

      procedure Reset;

      procedure Set;

      function Test return Boolean;

      entry Wait;

   private
      Completed                  : Boolean := False;
      Occured                    : Boolean := False;
   end Signal_Type;

end Main_Lib;
