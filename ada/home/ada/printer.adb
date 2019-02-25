with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Printer is
    task type Num_Printer; -- a type kulcs szóval tudok példányosíttatni

    task body Num_Printer is    
    begin
        for I in 1..1000 loop
            Put_Line(Integer'Image(I));
        end loop;
    end Num_Printer;

    T1, T2: Num_Printer;

begin
    null;
end Printer;