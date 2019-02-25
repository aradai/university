separate(simulation)

protected body Map is
        --getters
        function GetShip(C1, C2: in Coord) return Ship_Access is
        begin
            return Space(C1, C2).Ship;
        end GetShip;
        function GetAlive(C1, C2: in Coord) return Boolean is
        begin
            return Space(C1, C2).Alive;
        end GetAlive;
        --setters
        procedure SetShip(C1, C2: in Coord; S : in out Ship_Access) is
        begin
            null;
        end SetShip;
        procedure SetAlive(C1, C2: in Coord; L : in out Boolean) is
        begin
            Space(C1, C2).Alive := L;
        end SetAlive;
        --others
        procedure Init(Imperial, Rebel: out Base_Access) is
        Sum : Integer := 0;
        begin

        for I in Coord'First..Coord'Last/2 loop
            for J in Coord'Range loop
                Sum := Sum + 1;
                Space(J,I).Ship := new Ship(new String'("Imp" & Integer'Image(Sum)), Imperial); 
            end loop;
        end loop;
        Imperial.Send_Out_Ships(Sum);

        Sum := 0;

        for I in Coord'Last/2+1..Coord'Last loop
            for J in Coord'Range loop
                Sum := Sum + 1;
                Space(J,I).Ship := new Ship(new String'("Reb" & Integer'Image(Sum)), Rebel);
            end loop;
        end loop;
        Rebel.Send_Out_Ships(Sum);

        Printer.Print_Matrix;
        end Init;

        procedure End_Fight is
            AA : Agent_Access;
        begin
                for I in Coord'First..Coord'Last loop
                    for J in Coord'Range loop
                        if Space(I,J).Alive then
                            AA := new Agent(Space(I,J).Ship);
                            Space(I,J).Alive := False;
                        end if;
                    end loop;
                end loop;
        end End_Fight;
end Map;