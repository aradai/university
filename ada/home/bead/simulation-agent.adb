separate(simulation)

task body Agent is
begin
    select
        --accept Chtulhu do
            S.Call_Back;
        --end Chtulhu;
    or
        delay 1.0;
    end select;
end Agent;