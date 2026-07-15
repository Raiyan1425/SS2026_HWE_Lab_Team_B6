library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display_mux is
    Port (
        refresh_clk : in  STD_LOGIC;
        tens        : in  STD_LOGIC_VECTOR(3 downto 0);
        ones        : in  STD_LOGIC_VECTOR(3 downto 0);
        current_bcd : out STD_LOGIC_VECTOR(3 downto 0);
        AN          : out STD_LOGIC_VECTOR(7 downto 0)
    );
end display_mux;

architecture Behavioral of display_mux is
begin

    process(refresh_clk, tens, ones)
    begin
        if refresh_clk = '0' then
            -- Rightmost digit = ones
            AN <= "11111110";
            current_bcd <= ones;
        else
            -- Second digit = tens
            AN <= "11111101";
            current_bcd <= tens;
        end if;
    end process;

end Behavioral;