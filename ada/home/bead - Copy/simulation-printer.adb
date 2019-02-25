--with Ada.Text_IO;
--use Ada.Text_IO;

separate(simulation)
protected body Printer is
    procedure Print(S: String) is
    begin
        Put_Line(S);
    end Print;
    procedure Print_Matrix is
    begin
        for I in Coord'Range loop
            for J in Coord'Range loop
                if Map.GetAlive(I,J) then
                    Put(" | " & Map.GetShip(I, J).ID.all & " | ");
                else
                    Put(" | Dead | ");
                end if;
            end loop;
            New_Line;
        end loop;
        New_Line(2);
    end Print_Matrix;
end Printer;