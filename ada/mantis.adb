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
        procedure Print(S: String) is 
        begin
            Put_Line(S);
        end Print;
    end Printer;

    protected Random is
        function Random_Field return Field;
    private
        G: Field_Random.Generator;
    end Random;

    protected body Random is
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
        entry Mantisless(Is_Clear: out Boolean);
    end Garden;

    
    task body Mantis is
        Las_Pos: Field;
        Pos: Field := Random.Random_Field;
        Alive : Boolean := True;
    begin
        while Alive loop
            Las_Pos := Pos;
            Pos := Random.Random_Field;
            Garden.Jump(Las_Pos, Pos, Alive);
            Printer.Print("Mantis jumped from " & Field'Image(Las_Pos)
                            & " to " & Field'Image(Pos) & " and Alive = "
                            & Boolean'Image(Alive)
            );
            delay 1.5;
        end loop;
    end Mantis;

    task body Gardener is
        F:Field;
        Is_Clear : Boolean := False; 
    begin
        while not Is_Clear loop
            F := Random.Random_Field;
            Printer.Print("Gardener sprayed: " & Field'Image(F));
            Garden.Spray(F);
            delay 1.0;
            Garden.Mantisless(Is_Clear);
        end loop;
    end Gardener;

    task body Garden is
        Sprayed_Field : Field_X := 0;
        Clear_Garden : Boolean := False;
    begin
        loop
            select
                accept Spray(F: Field_X) do
                    Sprayed_Field := F;
                end Spray;
            or
                accept Jump (From, To: Field_X; Alive: out Boolean) do
                    Alive := From /= Sprayed_Field and then 
                                To /= Sprayed_Field;
                    Clear_Garden := not Alive;
                end Jump;
            or
                accept Mantisless (Is_Clear: out Boolean) do
                    Is_Clear := Clear_Garden;
                end Mantisless;
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