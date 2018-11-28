with Ada.Text_Io, Ada.Numerics.Discrete_Random, Ada.Calendar;
use Ada.Text_Io, Ada.Calendar;

procedure Simulation is

    K: constant Integer := 10;
    --type Garden is array(1..K) of Boolean;
    subtype Field_X is Integer range 0..K;
    subtype Field is Field_X range 1..K;

    package Field_Random  is new Ada.Numerics.Discrete_Random(Field);

    protected Printer is
        procedure Print(S: String);
    end Printer;
    protected body Printer is
    begin
        procedure Print(S: String) is begin Put_Line(S); end Put;
    end Printer;

    protected Random is
        function Random_Field return Field;
    private
        G: Field_Random.Generator;
    end Random;

    protected body Random is
    begin
    function Random_Field return Field is
       begin
           Field_Random.Reset(G);
           return Field_Random.Random(G);
       end Random_Field;
    end Random;


    task Mantis;
    task Gardener;
    task Garden is
        entry Spray(F : Field_X);
        entry Jump(From, To : Field_X; Alive : out Boolean);
    end Garden;

    
    task body Mantis is
        Las_Pos: Field;
        Pos: Field := Random.Random_Field;
        Alibe : Boolean := True;
    begin
        while Alive loop
            Las_Pos := Pos;
            Pos := Random.Random_Field;
            Garden.Jump(Las_Pos, Pos, Alive);
            delay 1.5;
        end loop;
    end Mantis;

    task body Gardener is
     
    begin
    end Gardener;

    task body Garden is
        Sprayed_Field : Field_X := 0;
        Alive : Integer := 1; --hard coded, later it will be M
    begin
        loop
            select

            or

            or
                terminate;
            end select;
        end loop;
    end Garden;


begin
    null;
end Simulation;

--egy protected-ben gátolják egymást 

--    protected Multi_Printer is
--        function Random_Field return Field;
--        procedure Put(S: String);
--    private
--        G: Field_Random.Generator;
--    end Multi_Printer;

--   protected body Multi_Printer is
--       function Random_Field return Field is
--       begin
--           Field_Random.Reset(G);
--           return Field_Random.Random(G);
--       end Random_Field;
--       procedure Put(S: String) is begin Put(S); end Put;
--   end Multi_Printer;