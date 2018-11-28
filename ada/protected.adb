with Ada.Text_IO;
use Ada.Text_IO;

procedure Protect is

    type String_Access is access String; --pointer
    task type Printer(ID: String_Access);

    protected Safe_Printer is
        procedure Print(S:String);
    end Safe_Printer;

    protected  body Safe_Printer is
        procedure Print(S: String) is
            begin
                for J in S'Range loop
                    Put(S(J));
                end loop;
                New_Line;
            end Print;
    end Safe_Printer;

    task body Printer is
    begin
        for I in 1..10 loop
            Safe_Printer.Print(ID.all & " Task: " & Integer'Image(I));
            delay 0.1;
        end loop;
    end Printer;

    T1: Printer(new String'("Elso")); --string pointer
    T2: Printer(new String'("Masodik"));

begin
    null;
end Protect;