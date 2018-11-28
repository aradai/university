with Ada.Text_IO;
use Ada.Text_IO;

procedure Simulation is

    type String_Access is access String; --pointer
    task type Drunk(Name: String_Access);
    task  Pub is
        entry Enter;
        entry Leave;
    end Pub;

    task body Pub is
        Drunk_Count : Integer := 0;
    begin
        loop
            select
                when Drunk_Count < 5 =>
                accept Enter;
                Drunk_Count := Drunk_Count + 1;
            or
                accept Leave;
                Drunk_Count := Drunk_Count - 1;
            or
                terminate;
            end select;
        end loop;
    end Pub;

    task body Drunk is
        Done: Boolean := False;
    begin
        while not Done loop
            select
                Pub.Enter;
                Done := True;
                Put_Line(Name.all & " iszik");
                delay 3.0;
                Pub.Leave;
            else
                delay 5.0;
                Put_Line(Name.all & " alszik");
            end select;
        end loop;
    end Drunk;

    D1: Drunk(new String'("Józsi "));
    D2: Drunk(new String'("a "));
    D3: Drunk(new String'("b "));
    D4: Drunk(new String'("c "));
    D5: Drunk(new String'("d "));
    D6: Drunk(new String'("e "));
    D7: Drunk(new String'("f "));
begin
    null;
end Simulation;