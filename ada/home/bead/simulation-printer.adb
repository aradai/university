--with Ada.Text_IO;
--use Ada.Text_IO;

separate(simulation)
protected body Printer is
    procedure Print(S: String) is
    begin
        Put_Line(S);
    end Print;
    --TODO procedure Print_Matrix()
end Printer;