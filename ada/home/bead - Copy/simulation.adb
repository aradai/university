with Ada.Text_IO, Ada.Numerics.Discrete_Random;
use Ada.Text_IO;

procedure Simulation is

    K: Integer := 10;

    subtype Coord is Integer range 1..K;
    type String_Access is access String;

    package Coord_Random is new Ada.Numerics.Discrete_Random(Coord);

    protected Printer is
        procedure Print(S: String);
        procedure Print_Matrix;
    end Printer;
    
    protected Safe_Random is
        procedure Random_Coord(C: out Coord);
    private
        G: Coord_Random.Generator;
    end Safe_Random;

    task type Base(ID: String_Access) is
        entry Send_Out_Ships(I: Integer);
        entry Ship_Lost;
        entry Destroy;
    end Base;

    type Base_Access is access Base;

    task type Ship(ID: String_Access; B: Base_Access) is
        entry Hit;
        entry Call_Back;
    end Ship;

    task type Projectile(B: Base_Access) is
    end Projectile;

    type Projectile_Access is access Projectile;
    
    type Ship_Access is access Ship;

    type Field is record
        Ship: Ship_Access;
        Alive: Boolean := True;
    end record;

    type My_Array is array(Coord range <>, Coord range <>) of Field;

    protected Map is 

        --getters
        function GetShip(C1, C2: in Coord) return Ship_Access;
        function GetAlive(C1, C2: in Coord) return Boolean;
        --setters
        procedure SetShip(C1, C2: in Coord; S : in out Ship_Access);
        procedure SetAlive(C1, C2: in Coord; L : in out Boolean);
        procedure Init(Imperial, Rebel: out Base_Access);
        procedure End_Fight;
    private
        Space: My_Array(Coord'Range, Coord'Range);
    end Map;

    task type Agent(S: Ship_Access) is
        --entry Chtulhu; 
    end Agent;
    --not sure it will be okay
    type Agent_Access is access Agent;

    


    --bodies
    protected body Safe_Random is separate; --Done
    protected body Printer is separate; --Done
    task body Base is separate; --Done

    Imperial : Base_Access := new Base(new String'("Death_Star"));
    Rebel : Base_Access := new Base(new String'("Rebel_Base"));

    task body Ship is separate; --Done
    task body Projectile is separate; --?
    protected body Map is separate;   --Done
    task body Agent is separate; --Done

    Luke_Skywalker: Ship_Access;
begin
    Map.Init(Imperial, Rebel);
    delay 5.0;
    Printer.Print("Luke is alive!");
    Luke_Skywalker := new Ship(new String'("Luke"), Rebel);
end Simulation;