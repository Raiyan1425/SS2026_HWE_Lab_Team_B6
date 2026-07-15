library IEEE;

entity clk_divider is
    generic (
        N : integer := 10
    );
    port (
        CLK   : in  BIT;
        CLK_N : out BIT
    );
end clk_divider;

architecture Behavioral of clk_divider is

    signal counter : integer range 0 to N-1 := 0;
    signal clk_out : BIT := '0';

begin

    process(CLK)
    begin
        if CLK'event and CLK = '1' then

            if counter = N-1 then
                counter <= 0;
                clk_out <= not clk_out;
            else
                counter <= counter + 1;
            end if;

        end if;
    end process;

    CLK_N <= clk_out;

end Behavioral;