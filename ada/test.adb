with Ada.Text_IO;
use Ada.Text_IO;

procedure Test is

    type String_Access is access String; --pointer
    task type Printer(ID: String_Access);

    task body Printer is
    begin
        for I in 1..10 loop
            declare
                S: String := ID.all & " Task: " & Integer'Image(I);
            begin
                for J in S'Range loop
                    Put(S(J));
                end loop;
                New_Line;
            end;
        end loop;
    end Printer;

    T1: Printer(new String'("Elso")); --string pointer
    T2: Printer(new String'("Masodik"));

begin
    null;
end Test;