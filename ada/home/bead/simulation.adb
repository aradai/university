with Ada.Text_IO, Ada.Numerics.Discrete_Random;
use Ada.Text_IO;

procedure Simulation is

    K: Integer := 10;

    subtype Coord is Integer range 1..K; --change K

    package Coord_Random is new Ada.Numerics.Discrete_Random(Coord);

    protected Printer is
        procedure Print(S: String);
        --procedure Print_Matrix();
    end Printer;
    protected body Printer is separate;

    protected Safe_Random is
        procedure Random_Coord(C: out Coord);
    private
        G: Coord_Random.Generator;
    end Safe_Random;
    protected body Safe_Random is separate; 

begin
    null;
end Simulation;