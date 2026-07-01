library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clock_divider is
    Port (
        CLK       : in  STD_LOGIC;
        refresh_clk : out STD_LOGIC
    );
end clock_divider;

architecture Behavioral of clock_divider is
    signal counter : unsigned(16 downto 0) := (others => '0');
begin

    process(CLK)
    begin
        if rising_edge(CLK) then
            counter <= counter + 1;
        end if;
    end process;

    refresh_clk <= counter(16);

end Behavioral;