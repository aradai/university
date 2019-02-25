separate(simulation)
task body Base is
    Ship_Number : Integer := 0;
    Alive : Boolean := True;
begin
    while Alive loop
        select
            accept Send_Out_Ships(I: Integer) do
                Ship_Number := I;
                Printer.Print(ID.all & " sends out ships" & Integer'Image(I));
            end Send_Out_Ships;
        or
            accept Ship_Lost do
                Ship_Number := Ship_Number - 1;
                Printer.Print(ID.all & " lost a ship, left: " & Integer'Image(Ship_Number)); 
                Printer.Print_Matrix;
                if Ship_Number = 0 then
                    Alive := False;
                    Printer.Print("All ship destroyed");
                    Map.End_Fight;
                end if;
            end Ship_Lost;
        or 
            accept Destroy do
                Printer.Print(ID.all & " destroyed");
                Map.End_Fight;
                Ship_Number := 0;
                Alive := False;
                Printer.Print("Rebels win");
            end Destroy;
        or
            terminate;
        end select;
    end loop;
end Base;